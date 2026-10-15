import Apollo
import Foundation
import SuwayomiAPI

protocol BookService: Sendable {
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
                inLibrary: filter.inLibrary ?? nil,
                first: .some(page.limit),
                after: page.token ?? nil
            )
        )

        guard let data = response.data?.mangas else {
            return PageResult.empty()
        }

        let books = data.nodes.compactMap { node in
            node.toBook()
        }

        return PageResult(
            items: books,
            hasMore: data.pageInfo.hasNextPage,
            totalCount: data.totalCount,
            nextToken: data.pageInfo.endCursor
        )
    }

    func getDetails(id: Int) async throws -> BookDetails? {
        let client = try client()

        let response = try await client.fetch(
            query: MangaDetailsQuery(
                id: .some(.init(id))
            )
        )

        guard let details = response.data?.mangas.nodes else {
            return nil
        }

        return details.first?.toDetails()
    }

    func getChapters(id: Int, page: PageRequest, filter: BookFilter) async throws -> PageResult<BookChapter> {
        let client = try client()

        let response = try await client.fetch(
            query: MangaChaptersQuery(
                id: .some(.init(id)),
                first: .some(page.limit),
                after: page.token ?? nil
            )
        )

        guard let data = response.data?.chapters else {
            return PageResult.empty()
        }

        let chapters = data.nodes.compactMap { node in
            node.toChapter()
        }

        return PageResult(
            items: chapters,
            hasMore: data.pageInfo.hasNextPage,
            totalCount: data.totalCount,
            nextToken: data.pageInfo.endCursor
        )
    }
}
