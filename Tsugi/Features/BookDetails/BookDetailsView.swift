import SwiftUI

struct BookDetailsView: View {
    @State private var viewModel: BookDetailsViewModel

    init(_ book: Book) {
        _viewModel = State(initialValue: BookDetailsViewModel(book))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
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
            .padding()
        }
        .toolbarVisibility(.hidden, for: .tabBar)
        .task {
            await viewModel.getDetails()
        }
    }
}

private struct Details: View {
    private let data: BookDetails?

    init(_ details: BookDetails?) {
        data = details
    }

    var body: some View {
        switch data {
        case let .some(details):
            VStack {
                if let description = details.description, !description.isEmpty {
                    Text(description)
                }
            }
        case .none:
            EmptyView()
        }
    }
}
