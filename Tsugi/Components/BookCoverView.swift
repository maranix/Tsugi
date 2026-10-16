import Kingfisher
import SwiftUI

struct BookCoverView: View {
    let book: Book

    init(_ book: Book) {
        self.book = book
    }

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.secondary.opacity(0.2))
                .overlay {
                    KFImage(book.thumbnailUrl)
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
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}
