import Apollo
import Foundation
import SuwayomiAPI

protocol ServerService {
    /// func getInfo() async throws -> ServerInfo
    /// func getSettings() async throws -> ServerSettings
    func getDashboard() async throws -> ServerDashboard
}

actor SuwayomiServer: ServerService {
    static let shared = SuwayomiServer {
        UserDefaults.standard.url(forKey: StorageKey.server)
    }

    init(_ baseUrl: @escaping @Sendable () -> URL?) {
        self.baseUrl = baseUrl
    }

    private var baseUrl: @Sendable () -> URL?
    private var cachedClient: (baseUrl: URL, client: ApolloClient)?

    private func client() throws -> ApolloClient {
        guard let url = baseUrl() else {
            throw URLError(.badURL)
        }

        let endpoint = url.appending(path: "api/graphql")

        if let cached = cachedClient, cached.baseUrl == endpoint {
            return cached.client
        }

        let client = ApolloClient(
            url: endpoint,
            defaultRequestConfiguration: .init(requestTimeout: 10)
        )

        cachedClient = (endpoint, client)
        return client
    }

    func getDashboard() async throws -> ServerDashboard {
        let client = try client()

        let response = try await client.fetch(query: ServerDashboardQuery())

        guard let data = response.data else {
            throw URLError(.badServerResponse)
        }

        return ServerDashboard(
            about: data.aboutServer.fragments.serverInfoFields.toServerInfo(),
            settings: data.settings.fragments.serverConfigFields.toServerSettings()
        )
    }
}
