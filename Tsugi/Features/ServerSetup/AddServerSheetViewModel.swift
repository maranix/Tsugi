//
//  AddServerSheetViewModel.swift
//  Tsugi
//
//  Created by Raman Verma on 07/10/26.
//

import os
import SwiftUI

@MainActor
@Observable
final class AddServerSheetViewModel {
    private let client: URLSession
    private let storage: ServerStorage

    init(storage: ServerStorage = AppPreferences.shared) {
        client = URLSession(configuration: .ephemeral)
        self.storage = storage
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

        if let portNumber = Int(port), (1 ... 65535).contains(portNumber) {
            components.port = portNumber
        }

        return components.url
    }

    func testConnection(using session: URLSession? = nil) async {
        if status.isLoading {
            return
        }

        guard let url = buildURL() else { return }

        status = .loading

        do {
            let (_, res) = try await (session ?? client).bytes(from: url)

            if let urlRes = res as? HTTPURLResponse, (200 ..< 300).contains(urlRes.statusCode) {
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
                "Tap on Test Connection to validate the connection first."
            )
            return false
        }

        guard let url = buildURL() else {
            status = .failure("Server details are not valid")
            return false
        }

        storage.setServerUrl(url)
        status = .success
        return true
    }
}
