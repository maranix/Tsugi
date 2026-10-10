import Apollo
import Foundation
import SuwayomiAPI

protocol LibraryService: Sendable {
    func get() async throws -> [LibraryQuery.Data.Mangas.Node]
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

    func get() async throws -> [LibraryQuery.Data.Mangas.Node] {
        let client = try client()

        let response = try await client.fetch(query: LibraryQuery())

        guard let library = response.data?.mangas.nodes else {
            return []
        }

        return library.compactMap(\.self)
    }
}
