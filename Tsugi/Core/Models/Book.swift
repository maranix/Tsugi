import Foundation

struct Book: Identifiable, Hashable, Sendable {
    let id: Int
    let title: String
    let thumbnail: String?

    func coverURL(baseURL: URL) -> URL? {
        guard let thumbnail, !thumbnail.isEmpty else {
            return nil
        }
        return baseURL.appending(path: thumbnail)
    }
}

extension Book {
    typealias Details = BookDetails
    typealias Chapter = BookChapter
    typealias Source = BookSource
}

struct BookDetails: Hashable, Sendable {
    let description: String?
    let author: String?
    let artist: String?
    let genre: [String]
    let status: String?
    let inLibrary: Bool
    let realUrl: String?

    init(
        description: String? = nil,
        author: String? = nil,
        artist: String? = nil,
        genre: [String] = [],
        status: String? = nil,
        inLibrary: Bool = false,
        realUrl: String? = nil
    ) {
        self.description = description
        self.author = author
        self.artist = artist
        self.genre = genre
        self.status = status
        self.inLibrary = inLibrary
        self.realUrl = realUrl
    }

    var sourceURL: URL? {
        guard let realUrl, !realUrl.isEmpty else { return nil }
        return URL(string: realUrl)
    }
}

struct BookChapter: Identifiable, Hashable, Sendable {
    let id: Int
    let number: Double
    let name: String
    let realUrl: String?
    let scanlator: String?
    let isRead: Bool
    let isBookmarked: Bool
    let isDownloaded: Bool
    let pageCount: Int

    init(
        id: Int,
        number: Double,
        name: String,
        realUrl: String? = nil,
        scanlator: String? = nil,
        isRead: Bool = false,
        isBookmarked: Bool = false,
        isDownloaded: Bool = false,
        pageCount: Int = 0
    ) {
        self.id = id
        self.number = number
        self.name = name
        self.realUrl = realUrl
        self.scanlator = scanlator
        self.isRead = isRead
        self.isBookmarked = isBookmarked
        self.isDownloaded = isDownloaded
        self.pageCount = pageCount
    }

    var sourceURL: URL? {
        guard let realUrl, !realUrl.isEmpty else { return nil }
        return URL(string: realUrl)
    }

    var displayName: String {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmed.isEmpty {
            return trimmed
        }

        return number.truncatingRemainder(dividingBy: 1) == 0
            ? "Chapter \(Int(number))"
            : "Chapter \(number)"
    }
}

struct BookSource: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let displayName: String
    let iconUrl: String?
    let supportsLatest: Bool

    init(
        id: String,
        name: String,
        displayName: String,
        iconUrl: String? = nil,
        supportsLatest: Bool = false
    ) {
        self.id = id
        self.name = name
        self.displayName = displayName
        self.iconUrl = iconUrl
        self.supportsLatest = supportsLatest
    }
}
