import Apollo
import Foundation
import SuwayomiAPI

protocol MangaService: Sendable {
    func getAll(fromLibrary: Bool) async throws -> [Book]
}

extension MangaListQuery.Data.Mangas.Node.Source {
    func toSuwayomiSource() -> SuwayomiMetadata.Source {
        SuwayomiMetadata.Source(
            name: name,
            displayName: displayName,
            lang: lang,
            home: homeUrl,
            icon: iconUrl
        )
    }
}

extension MangaListQuery.Data.Mangas.Node {
    func toBook() -> Book {
        let thumbnail = thumbnailUrl

        let metadata = SuwayomiMetadata(
            author: author,
            artist: artist,
            description: description,
            genre: genre,
            status: status.rawValue,
            url: url,
            source: source?.toSuwayomiSource()
        )

        return Book(
            id: id,
            title: title,
            thumbnail: thumbnail,
            metadata: .suwayomi(metadata)
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
}
