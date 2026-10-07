//
//  AddServerSheetViewModel.swift
//  Tsugi
//
//  Created by Raman Verma on 07/10/26.
//

import SwiftUI

enum URLScheme: String, CaseIterable, Identifiable {
    case http
    case https

    var id: String { rawValue }

    var prefix: String {
        "\(rawValue)://"
    }

    var displayName: String {
        rawValue.uppercased()
    }
}

@MainActor
@Observable
final class AddServerSheetViewModel {
    private let storage: ServerStorage
    private let healthService: ServerHealthService

    init(
        _ storage: ServerStorage,
        healthService: ServerHealthService,
    ) {
        self.storage = storage
        self.healthService = healthService
    }

    convenience init(
        _ storage: ServerStorage,
    ) {
        self.init(
            storage,
            healthService: DefaultServerHealthService()
        )
    }

    var status: AsyncStatus = .idle

    var scheme: URLScheme = .http {
        didSet {
            status = .idle
        }
    }

    var host: String = "" {
        didSet {
            status = .idle
        }
    }

    var port: String = "" {
        didSet {
            status = .idle
        }
    }

    func buildURL() -> URL? {
        let trimmedHost = host.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedHost.isEmpty else { return nil }

        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = trimmedHost

        if let portNumber = Int(port), (1...65535).contains(portNumber) {
            components.port = portNumber
        }

        return components.url
    }

    func testConnection() async {
        if status.isLoading { return }

        guard let url = buildURL() else { return }

        status = .loading

        do {
            let success = try await healthService.ping(to: url)

            if success {
                status = .success
            } else {
                status = .failure(
                    "Unable to establish a connection with the Server"
                )
            }
        } catch {
            status = .failure(error.localizedDescription)
        }
    }

    func saveConnection() -> Bool {
        if !status.isSuccess {
            status = .failure(
                "Tap on Test Connection to verify the details first."
            )
            return false
        }

        guard let url = buildURL() else {
            status = .failure("Server details are not valid")
            return false
        }

        do {
            try storage.save(ServerConfig(baseURL: url))
            status = .success
            return true
        } catch {
            status = .failure(error.localizedDescription)
            debugPrint(
                "Unable to save ServerConfig object: ",
                error.localizedDescription
            )
            return false
        }
    }
}
