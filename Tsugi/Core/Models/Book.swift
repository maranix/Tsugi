import Foundation

struct Book: Identifiable, Hashable, Sendable {
    let id: Int
    let title: String
    let thumbnail: String?

    func thumbnailUrl(_ baseURL: URL) -> URL? {
        guard let path = thumbnail, !path.isEmpty else {
            return nil
        }

        return baseURL.appending(path: path)
    }
}

struct BookDetails: Sendable {
    enum Source {
        case suwayomi(Suwayomi)
    }

    struct Suwayomi: Sendable {
        let author: String?
        let artist: String?
        let description: String?
        let genre: [String]
        let realUrl: String?
        let status: String
        let inLibrary: Bool

        func sourceUrl() -> URL? {
            guard let url = realUrl, !url.isEmpty else {
                return nil
            }

            return URL(string: url)
        }
    }
}

struct BookChapter: Sendable {
    enum Source {
        case suwayomi(Suwayomi)
    }

    struct Suwayomi: Identifiable {
        let id: Int
        let number: Double
        let name: String
        let realUrl: String?
        let scanlator: String?

        func sourceUrl() -> URL? {
            guard let url = realUrl, !url.isEmpty else {
                return nil
            }

            return URL(string: url)
        }
    }
}
