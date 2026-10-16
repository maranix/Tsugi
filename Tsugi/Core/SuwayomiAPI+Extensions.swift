import Apollo
import Foundation
import SuwayomiAPI

extension MangaListQuery.Data.Mangas.Node {
    func toBook(thumbnailBaseUrl: URL? = nil) -> Book {
        let url = thumbnailUrl.flatMap { path in
            path.isEmpty ? nil : thumbnailBaseUrl?.appending(path: path)
        }

        return Book(
            id: id,
            title: title,
            thumbnail: thumbnailUrl,
            thumbnailUrl: url
        )
    }
}
