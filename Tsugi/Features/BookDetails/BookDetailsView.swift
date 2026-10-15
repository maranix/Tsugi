import Kingfisher
import SwiftUI

struct BookDetailsView: View {
    private let cover: URL?
    @State private var viewModel: BookDetailsViewModel

    init(_ book: Book, cover: URL? = nil) {
        _viewModel = State(initialValue: BookDetailsViewModel(book))
        self.cover = cover
    }

    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottom) {
                    KFImage(cover)
                        .resizable()
                        .scaledToFit()

                    Text(viewModel.book.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.ultraThinMaterial)
                }

                Details()
                Chapters()
            }
        }
        .ignoresSafeArea(edges: .top)
        .toolbarVisibility(.hidden, for: .tabBar)
        .task {
            await viewModel.getDetails()
        }
        .environment(viewModel)
    }
}

private struct Details: View {
    @Environment(BookDetailsViewModel.self) private var viewModel

    var body: some View {
        switch viewModel.details {
        case let .some(details):
            VStack(alignment: .leading, spacing: 12) {
                if let description = details.description, !description.isEmpty {
                    Text(description)
                }
            }
            .padding()
        case .none:
            EmptyView()
        }
    }
}

private struct Chapters: View {
    @Environment(BookDetailsViewModel.self) private var viewModel

    var body: some View {
        if viewModel.chapters.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 12) {
                Text("Chapters")
                    .font(.title3)

                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.chapters) { chapter in
                        Text(chapter.name)
                            .padding(.vertical)
                    }

                    if viewModel.hasNext {
                        ProgressView()
                            .frame(minWidth: .infinity, alignment: .center)
                            .task {
                                await viewModel.loadMoreChapters()
                            }
                    }
                }
            }
            .padding()
        }
    }
}
