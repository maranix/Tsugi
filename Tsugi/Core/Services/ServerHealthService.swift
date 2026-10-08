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

    init(interval: TimeInterval = 10.0) {
        let config = URLSessionConfiguration.ephemeral
        config.timeoutIntervalForRequest = interval

        client = URLSession(configuration: config)
    }

    func ping(to url: URL) async throws -> Bool {
        let (_, res) = try await client.data(from: url)

        if let response = res as? HTTPURLResponse {
            if (200 ..< 500).contains(response.statusCode) {
                return true
            }
        }

        return false
    }
}
