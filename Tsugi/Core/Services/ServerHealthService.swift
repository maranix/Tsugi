//
//  ServerHealthService.swift
//  Tsugi
//
//  Created by Raman Verma on 07/10/26.
//

import Foundation

protocol ServerHealthService: Sendable {
    func ping(to url: URL) async throws -> Bool
}

struct DefaultServerHealthService: ServerHealthService {
    private let client: URLSession

    init(client: URLSession = .init(configuration: .ephemeral)) {
        client.configuration.timeoutIntervalForRequest = 5
        self.client = client
    }

    func ping(to url: URL) async throws -> Bool {
        let (_, res) = try await client.data(from: url)

        if let response = res as? HTTPURLResponse {
            if (200 ... 299).contains(response.statusCode) {
                return true
            }
        }

        return false
    }
}
