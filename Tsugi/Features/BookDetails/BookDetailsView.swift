import SwiftUI

struct BookDetailsView: View {
    @Environment(\.serverStorage) private var serverStorage

    private var mangaService: DefaultMangaService?
    private var viewModel: BookDetailsViewModel

    init(_ book: Book) {
        viewModel = BookDetailsViewModel(book: book)
    }

    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.book.title)

                Group {
                    switch viewModel.status {
                    case .loading:
                        ProgressView()
                    case .success:
                        Details(viewModel.details)
                    case let .failure(msg):
                        Text(msg)
                    default:
                        EmptyView()
                    }
                }
            }
        }
        .task {
            await viewModel.getDetails(using: DefaultMangaService(serverStorage: serverStorage))
        }
    }
}

private struct Details: View {
    private let data: BookDetails.Suwayomi?

    init(_ details: BookDetails.Suwayomi?) {
        data = details
    }

    var body: some View {
        switch data {
        case let .some(details):
            VStack {
                if let description = details.description, !description.isEmpty,
                   let attributed = try? AttributedString(markdown: description)
                {
                    Text(attributed)
                }
            }
        case .none:
            EmptyView()
        }
    }
}
