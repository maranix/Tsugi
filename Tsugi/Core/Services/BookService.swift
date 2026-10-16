import Apollo
import Foundation
import SuwayomiAPI

protocol BookService: Sendable {
    func getLibrary(first: Int, after: String?) async throws -> PagedResult<Book>
    func getMangaAndChapters(id: Int) async throws -> BookContent
}

extension BookService {
    func getLibrary(first: Int = 20, after: String? = nil) async throws -> PagedResult<Book> {
        try await getLibrary(first: first, after: after)
    }
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

    func getLibrary(first: Int = 20, after: String? = nil) async throws -> PagedResult<Book> {
        let client = try client()

        let response = try await client.fetch(
            query: MangaListQuery(
                inLibrary: true,
                first: Int32(first),
                orderBy: .case(.title),
                orderType: .case(.asc),
                after: after ?? nil
            )
        )

        guard let data = response.data?.mangas else {
            throw URLError(.badServerResponse)
        }

        let serverUrl = baseUrl()
        let books = data.nodes.compactMap { node in
            node.toBook(thumbnailBaseUrl: serverUrl)
        }

        return PagedResult(
            items: books,
            hasMore: data.pageInfo.hasNextPage,
            nextCursor: data.pageInfo.endCursor
        )
    }

    func getMangaAndChapters(id: Int) async throws -> BookContent {
        let client = try client()

        let response = try await client.perform(
            mutation: FetchMangaAndChaptersMutation(id: Int32(id))
        )

        guard let data = response.data?.fetchMangaAndChapters else {
            throw URLError(.badServerResponse)
        }

        return data.toBookContent()
    }
}
