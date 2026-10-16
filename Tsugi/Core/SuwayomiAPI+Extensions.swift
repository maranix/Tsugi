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
        let real = realUrl.flatMap { path in
            path.isEmpty ? nil : URL(string: path)
        }

        return BookDetails(
            description: description,
            author: author,
            artist: artist,
            genre: genre,
            status: status.rawValue,
            inLibrary: inLibrary,
            realUrl: real,
            hasDuplicateChapters: hasDuplicateChapters,
            unreadCount: unreadCount
        )
    }
}

extension FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.Chapter {
    func toBookChapter() -> BookChapter {
        let real = realUrl.flatMap { path in
            path.isEmpty ? nil : URL(string: path)
        }

        return BookChapter(
            id: id,
            chapterNumber: chapterNumber,
            name: name,
            realUrl: real,
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

extension SourceListQuery.Data.Sources.Node {
    func toBookSource(iconBaseUrl: URL? = nil) -> BookSource {
        let home = homeUrl.flatMap { path in
            path.isEmpty ? nil : URL(string: path)
        }

        let icon = iconBaseUrl?.appending(path: iconUrl)

        return BookSource(
            id: id,
            name: name,
            displayName: displayName,
            iconUrl: icon,
            homeUrl: home,
            lang: lang,
            contentWarning: contentWarning.rawValue,
            isConfigurable: isConfigurable
        )
    }
}

extension FetchSourceMangaListMutation.Data.FetchSourceManga.Manga {
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
