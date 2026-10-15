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

                VStack(alignment: .leading, spacing: 12) {
                    Details(viewModel.details)
                }
                .padding()
                .frame(maxHeight: .infinity, alignment: .leading)
            }
        }
        .ignoresSafeArea(edges: .top)
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
