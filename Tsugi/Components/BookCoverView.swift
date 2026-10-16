import Kingfisher
import SwiftUI

struct BookCoverView: View {
    private let book: Book
    private var thumbnail: URL?

    init(_ book: Book) {
        self.book = book

        guard let baseUrl = AppPreferences.shared.serverUrl else { return }

        thumbnail = book.coverURL(baseURL: baseUrl)
    }

    init(_ book: Book, baseUrl: URL) {
        self.book = book
        thumbnail = book.coverURL(baseURL: baseUrl)
    }

    var body: some View {
        NavigationLink(value: RouteCoordinator.Destination.bookDetails(book, cover: thumbnail)) {
            VStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.secondary.opacity(0.2))
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .overlay {
                        KFImage(thumbnail)
                            .placeholder {
                                Image(systemName: "photo")
                                    .foregroundStyle(.secondary)
                            }
                            .fade(duration: 0.5)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                ZStack(alignment: .topLeading) {
                    Text(" \n ")
                        .hidden()

                    Text(book.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
        }
    }
}
