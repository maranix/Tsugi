import Kingfisher
import SwiftUI

struct DiscoverView: View {
    @Environment(AppPreferences.self) private var preferences

    @State private var router = NavigationRouter<RouteCoordinator.Destination>()
    @State private var viewModel = DiscoverViewModel()

    var body: some View {
        NavigationStack(path: $router.stack) {
            ServerContentView {
                switch viewModel.status {
                case .success:
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.sources) { source in
                                SourceSection(source)
                                    .environment(viewModel)
                            }

                            if viewModel.hasMore {
                                ProgressView()
                                    .task {
                                        await viewModel.loadNext()
                                    }
                            }
                        }
                        .padding()
                    }
                    .scrollIndicators(.never)
                    .refreshable(action: viewModel.get)
                    .navigationDestination(for: RouteCoordinator.Destination.self) { dest in
                        switch dest {
                        case let .bookDetails(book):
                            BookContentView(book)
                        }
                    }
                case let .failure(msg):
                    Text(msg)
                default:
                    ProgressView()
                }
            }
            .navigationTitle("Discover")
            .task {
                if viewModel.status.isIdle {
                    await viewModel.get()
                }
            }
            .onChange(of: preferences.serverUrl) {
                Task {
                    await viewModel.get()
                }
            }
        }
    }
}

private struct SourceSection: View {
    @Environment(DiscoverViewModel.self) private var viewModel

    let source: BookSource

    init(_ source: BookSource) {
        self.source = source
    }

    var header: some View {
        HStack(spacing: 4) {
            KFImage(source.iconUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)

            Text(source.displayName)
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    var body: some View {
        Section(header: header) {
            if let books = viewModel.sourceIdToBookListDict[source.id], !books.isEmpty {
                let columns = stride(from: 0, to: 4, by: 2).map {
                    Array(books[$0 ..< min($0 + 2, 4)])
                }

                ForEach(columns, id: \.first?.id) { column in
                    HStack {
                        ForEach(column) { book in
                            NavigationLink(value: RouteCoordinator.Destination.bookDetails(book)) {
                                BookCoverView(book)
                                    .aspectRatio(2 / 3, contentMode: .fit)
                            }
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadBookListFromSource(id: source.id)
        }
    }
}
