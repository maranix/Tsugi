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

extension FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.Manga {
    func toBookDetails() -> BookDetails {
        BookDetails(
            description: description,
            author: author,
            artist: artist,
            genre: genre,
            status: status.rawValue,
            inLibrary: inLibrary,
            realUrl: realUrl,
            hasDuplicateChapters: hasDuplicateChapters,
            unreadCount: unreadCount
        )
    }
}

extension FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.Chapter {
    func toBookChapter() -> BookChapter {
        BookChapter(
            id: id,
            chapterNumber: chapterNumber,
            name: name, realUrl: realUrl,
            scanlator: scanlator,
            isRead: isRead,
            isBookmarked: isBookmarked,
            isDownloaded: isDownloaded
        )
    }
}

extension FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters {
    func toBookContent() -> BookContent {
        BookContent(
            details: manga.toBookDetails(),
            chapters: chapters.compactMap { chapter in
                chapter.toBookChapter()
            }
        )
    }
}
