import Apollo
import Foundation
import SuwayomiAPI

protocol BookService {
    func get(page: PageRequest, filter: BookFilter) async throws -> PageResult<Book>
    func getDetails(id: Int) async throws -> BookDetails?
    func getChapters(id: Int, page: PageRequest, filter: BookFilter) async throws -> PageResult<BookChapter>
}

actor SuwayomiService: BookService {
    static let shared = SuwayomiService { UserDefaults.standard.url(forKey: StorageKey.server) }

    private(set) var cachedClient: (url: URL, client: ApolloClient)?

    private let baseUrl: @Sendable () -> URL?

    init(_ baseUrl: @escaping @Sendable () -> URL?) {
        self.baseUrl = baseUrl
    }

    private func client() throws -> ApolloClient {
        guard let url = baseUrl() else {
            throw URLError(.badURL)
        }

        let endpoint = url.appending(path: "api/graphql")

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

    func get(page: PageRequest, filter: BookFilter) async throws -> PageResult<Book> {
        let client = try client()

        let response = try await client.fetch(
            query: MangaListQuery(
                inLibrary: filter.inLibrary.toGraphQLNullable()
            )
        )

        guard let list = response.data?.mangas.nodes else {
            return PageResult.empty()
        }

        let books = list.compactMap { node in
            node.toBook()
        }

        return PageResult(items: books, hasMore: false)
    }

    func getDetails(id: Int) async throws -> BookDetails? {
        let client = try client()

        let response = try await client.fetch(query: MangaDetailsQuery(id: .some(Int32(id))))

        guard let details = response.data?.mangas.nodes else {
            return nil
        }

        return details.first?.toDetails()
    }

    func getChapters(id: Int, page: PageRequest, filter: BookFilter) async throws -> PageResult<BookChapter> {
        _ = try client()

        return PageResult.empty()
    }
}
