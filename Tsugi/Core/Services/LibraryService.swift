import Apollo
import Foundation
import SuwayomiAPI

protocol LibraryService: Sendable {
    func getAll() async throws -> [Manga]
}

extension LibraryQuery.Data.Mangas.Node {
    func toManga(baseURL: URL?) -> Manga {
        Manga(
            id: id,
            title: title,
            thumbnailURL: thumbnailUrl.flatMap { path in
                path.isEmpty ? nil : baseURL?.appending(path: path)
            }
        )
    }
}

final class DefaultLibraryService: LibraryService {
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

        let client = ApolloClient(url: endpoint, defaultRequestConfiguration: .init(requestTimeout: 10))
        cachedClient = (endpoint, client)
        return client
    }

    func getAll() async throws -> [Manga] {
        let client = try client()

        let response = try await client.fetch(query: LibraryQuery())

        guard let list = response.data?.mangas.nodes else {
            return []
        }

        return list.compactMap { node in
            node.toManga(baseURL: serverStorage.config?.baseURL)
        }
    }
}
