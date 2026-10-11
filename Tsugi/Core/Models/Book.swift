import Foundation

struct Book: Identifiable, Hashable, Sendable {
    enum Metadata: Hashable, Sendable {
        case suwayomi(SuwayomiMetadata)
    }

    let id: Int
    let title: String
    let thumbnail: String?
    let metadata: Metadata

    func thumbnailUrl(_ baseURL: URL) -> URL? {
        guard let path = thumbnail, !path.isEmpty else {
            return nil
        }

        return baseURL.appending(path: path)
    }
}

struct SuwayomiMetadata: Hashable, Sendable {
    struct Source: Hashable, Sendable {
        let name: String
        let displayName: String
        let lang: String
        let home: String?
        let icon: String

        func homeUrl() -> URL? {
            guard let url = home, !url.isEmpty else {
                return nil
            }

            return URL(string: url)
        }

        func iconUrl(_ baseURL: URL) -> URL {
            baseURL.appending(path: icon)
        }
    }

    let author: String?
    let artist: String?
    let description: String?
    let genre: [String]
    let status: String
    let url: String
    let source: Source?

    func sourcePageURL() -> URL? {
        guard let src = source?.homeUrl() else {
            return nil
        }

        return src.appending(path: url)
    }
}
