import Apollo
import Foundation
import SuwayomiAPI

protocol MangaService: Sendable {
    func getAll(fromLibrary: Bool) async throws -> [Book]
    func getDetails(id: Int) async throws -> BookDetails.Suwayomi?
    func getChapterList(id: Int, limit: Int, cursor: String?) async throws -> [BookChapter.Suwayomi]
}

extension MangaListQuery.Data.Mangas.Node {
    func toBook() -> Book {
        let thumbnail = thumbnailUrl

        return Book(
            id: id,
            title: title,
            thumbnail: thumbnail
        )
    }
}

extension MangaDetailsQuery.Data.Mangas.Node {
    func toDetails() -> BookDetails.Suwayomi {
        BookDetails.Suwayomi(
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
    func toChapter() -> BookChapter.Suwayomi {
        BookChapter.Suwayomi(
            id: id,
            number: chapterNumber,
            name: name,
            realUrl: realUrl,
            scanlator: scanlator
        )
    }
}

final class DefaultMangaService: MangaService {
    private(set) var serverStorage: ServerStorage
    private(set) var cachedClient: (url: URL, client: ApolloClient)?

    private let lock = NSLock()

    init(serverStorage: ServerStorage) {
        self.serverStorage = serverStorage
    }

    func client() throws -> ApolloClient {
        guard let config = serverStorage.config else {
            throw URLError(.badURL)
        }

        let endpoint = config.baseURL.appending(path: "api/graphql")

        lock.lock()
        defer { lock.unlock() }

        if let cached = cachedClient, cached.url == endpoint {
            return cached.client
        }

        let client = ApolloClient(
            url: endpoint,
            defaultRequestConfiguration: .init(requestTimeout: 10)
        )

        cachedClient = (endpoint, client)
        return client
    }

    func getAll(fromLibrary: Bool) async throws -> [Book] {
        let client = try client()

        let response = try await client.fetch(query: MangaListQuery(inLibrary: .some(fromLibrary)))

        guard let list = response.data?.mangas.nodes else {
            return []
        }

        return list.compactMap { node in
            node.toBook()
        }
    }

    func getDetails(id: Int) async throws -> BookDetails.Suwayomi? {
        let client = try client()

        let response = try await client.fetch(query: MangaDetailsQuery(id: .some(Int32(id))))

        guard let details = response.data?.mangas.nodes else {
            return nil
        }

        return details.first?.toDetails()
    }

    func getChapterList(id: Int, limit: Int = 20, cursor: String? = nil) async throws -> [BookChapter.Suwayomi] {
        let client = try client()

        let response = try await client.fetch(
            query: MangaChaptersQuery(
                id: .some(Int32(id)),
                first: .some(Int32(limit)),
                after: cursor != nil ? .some(cursor!) : .null,
                orderBy: .some(.case(.asc))
            )
        )

        guard let chapters = response.data?.chapters.nodes else {
            return []
        }

        return chapters.compactMap { chapter in
            chapter.toChapter()
        }
    }
}
