import Foundation

struct Book: Identifiable, Hashable, Sendable {
    let id: Int
    let title: String
    let thumbnail: String?
    let thumbnailUrl: URL?
}

struct BookDetails: Hashable, Sendable {
    let description: String?
    let author: String?
    let artist: String?
    let genre: [String]
    let status: String?
    let inLibrary: Bool
    let realUrl: String?
    let hasDuplicateChapters: Bool
    let unreadCount: Int
}

struct BookChapter: Identifiable, Hashable, Sendable {
    let id: Int
    let chapterNumber: Double
    let name: String
    let realUrl: String?
    let scanlator: String?
    let isRead: Bool
    let isBookmarked: Bool
    let isDownloaded: Bool

    var displayName: String {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmed.isEmpty {
            return trimmed
        }

        return "Chapter \(chapterNumber)"
    }
}

struct BookSource: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let displayName: String
    let iconUrl: String?
    let supportsLatest: Bool
}
