import Foundation

struct Book: Identifiable, Hashable, Sendable {
    enum Provider: Hashable, Sendable {
        case suwayomi

        var idPrefix: String {
            switch self {
            case .suwayomi: "suwayomi"
            }
        }
    }

    struct Details: Hashable, Sendable {
        let author: String?
        let artist: String?
        let description: String?
        let genre: [String]
        let realUrl: String?
        let status: String
        let inLibrary: Bool

        var sourceUrl: URL? {
            guard let url = realUrl, !url.isEmpty else { return nil }
            return URL(string: url)
        }
    }

    struct Chapter: Identifiable, Hashable, Sendable {
        let id: Int
        let number: Double
        let name: String
        let realUrl: String?
        let scanlator: String?

        var sourceUrl: URL? {
            guard let url = realUrl, !url.isEmpty else { return nil }
            return URL(string: url)
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

    struct Content: Hashable, Sendable {
        var details: Details?
        var chapters: [Chapter]

        init(details: Details? = nil, chapters: [Chapter] = []) {
            self.details = details
            self.chapters = chapters
        }
    }

    var id: String {
        "\(provider.idPrefix):\(rawId)"
    }

    let provider: Provider

    let rawId: Int
    let title: String
    let thumbnail: String?

    func thumbnailUrl(_ baseURL: URL) -> URL? {
        guard let path = thumbnail, !path.isEmpty else {
            return nil
        }

        return baseURL.appending(path: path)
    }
}
