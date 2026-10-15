import Apollo
import SuwayomiAPI

extension Bool? {
    func toGraphQLNullable() -> GraphQLNullable<Bool> {
        guard let notNull = self else {
            return .none
        }

        return .some(notNull)
    }
}

extension MangaListQuery.Data.Mangas.Node {
    func toBook() -> Book {
        .init(
            source: .suwayomi,
            rawId: id,
            title: title,
            thumbnail: thumbnailUrl
        )
    }
}

extension MangaDetailsQuery.Data.Mangas.Node {
    func toDetails() -> BookDetails {
        .init(
            author: author,
            artist: artist,
            description: description,
            genre: genre,
            realUrl: realUrl,
            status: status.rawValue,
            inLibrary: inLibrary
        )
    }
}

extension MangaChaptersQuery.Data.Chapters.Node {
    func toChapter() -> BookChapter {
        .init(
            id: id,
            number: chapterNumber,
            name: name,
            realUrl: realUrl,
            scanlator: scanlator
        )
    }
}
