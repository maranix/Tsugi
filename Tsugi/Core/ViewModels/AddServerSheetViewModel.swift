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

enum ConnectionStatus: Equatable {
    case idle
    case connecting
    case connected
    case failure(String)

    var failureMessage: String? {
        guard case .failure(let message) = self else { return nil }
        return message
    }
}

@MainActor
@Observable
final class AddServerSheetViewModel {
    private let serverStore: ServerStore

    init(serverStore: ServerStore) {
        self.serverStore = serverStore
    }

    var status: ConnectionStatus = .idle

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

    var isTesting: Bool {
        status == .connecting
    }

    var isFailure: Bool {
        status.failureMessage != nil
    }

    var isSuccess: Bool {
        status == .connected
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
        if isTesting { return }

        guard let url = buildURL() else { return }

        status = .connecting

        do {
            let req = URLRequest(url: url)

            let (_, res) = try await URLSession.shared.data(for: req)

            if let resStatus = res as? HTTPURLResponse,
                (200...299).contains(resStatus.statusCode)
            {
                status = .connected
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
        if !isSuccess {
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
            try serverStore.save(ServerConfig(baseURL: url))
            status = .connected
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
