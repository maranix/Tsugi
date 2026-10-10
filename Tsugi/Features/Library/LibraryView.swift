import SuwayomiAPI
import SwiftUI

struct LibraryView: View {
    @Environment(MainRouter.self) private var mainRouter

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]

    @State private var router = NavigationRouter<AppRoute.Destination>()
    @State private var viewModel = LibraryViewModel()

    var body: some View {
        NavigationStack(path: $router.stack) {
            ScrollView {
                switch viewModel.status {
                case .success:
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.mangas, id: \.id) { manga in
                            VStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.secondary.opacity(0.15))
                                    .aspectRatio(2 / 3, contentMode: .fit)
                                    .overlay {
                                        AsyncImage(url: URL(string: "http://192.168.1.200:4567\(manga.thumbnailUrl!)")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .foregroundStyle(.secondary)
                                            case let .success(img):
                                                img
                                                    .resizable()
                                                    .scaledToFill()
                                            default:
                                                EmptyView()
                                            }
                                        }
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 8))

                                ZStack(alignment: .topLeading) {
                                    Text(" \n ")
                                        .hidden()

                                    Text(manga.title)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                        }
                    }
                case let .failure(msg):
                    Text(msg)
                default:
                    ProgressView()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        mainRouter.pushSheet(.settings)
                    } label: {
                        Image(systemName: SFSymbol.settings)
                    }
                }

                ToolbarSpacer(.flexible, placement: .bottomBar)
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
            }
            .searchable(text: $viewModel.searchText)
            .searchToolbarBehavior(.minimize)
            .scrollIndicators(.never)
            .navigationDestination(for: AppRoute.Destination.self) { dest in
                switch dest {
                case let .item(index):
                    Text("Item Page")
                        .navigationTitle("Item \(index)")
                }
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(1))
            await viewModel.getAll()
        }
    }
}
