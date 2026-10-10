import SwiftUI

struct MangaView: View {
    private let manga: Manga

    init(_ manga: Manga) {
        self.manga = manga
    }

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.secondary.opacity(0.15))
                .aspectRatio(2 / 3, contentMode: .fit)
                .overlay {
                    AsyncImage(url: manga.thumbnailURL) { phase in
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
