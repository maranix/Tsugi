import Apollo
import SuwayomiAPI

extension MangaListQuery.Data.Mangas.Node {
    func toBook() -> Book {
        .init(
            id: id,
            title: title,
            thumbnail: thumbnailUrl
        )
    }
}
