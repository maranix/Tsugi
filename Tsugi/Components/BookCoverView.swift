import SwiftUI

struct BookCoverView: View {
    private let book: Book
    private var baseURL: URL?

    init(_ book: Book) {
        self.book = book
        baseURL = AppPreferences.shared.serverUrl
    }

    init(_ book: Book, baseURL: URL) {
        self.book = book
        self.baseURL = baseURL
    }

    var resolveThumbnail: URL? {
        guard let base = baseURL else {
            return nil
        }

        return book.thumbnailUrl(base)
    }

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.secondary.opacity(0.15))
                .aspectRatio(2 / 3, contentMode: .fit)
                .overlay {
                    if let thumbnailURL = resolveThumbnail {
                        AsyncImage(url: thumbnailURL) { phase in
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
                    } else {
                        Image(systemName: "photo")
                            .foregroundStyle(.secondary)
                    }
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
