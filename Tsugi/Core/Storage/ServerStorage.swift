//
//  ServerStorage.swift
//  Tsugi
//
//  Created by Raman Verma on 07/10/26.
//

import Foundation
import os

private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "Tsugi", category: "Storage")

@MainActor
protocol ServerStorage {
    var config: ServerConfig? { get }
    var isConfigured: Bool { get }

    func save(_ config: ServerConfig) throws
    func reset()
}

@MainActor
@Observable
final class ServerStore: ServerStorage {
    private let userDefaults: UserDefaults

    private(set) var config: ServerConfig?

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults

        if let configData = userDefaults.data(forKey: StorageKey.Server.config) {
            do {
                config = try JSONDecoder().decode(
                    ServerConfig.self,
                    from: configData
                )
            } catch {
                // Saved data is corrupted, better to clear it out
                userDefaults.removeObject(forKey: StorageKey.Server.config)
                logger.error("Failed to decode saved ServerConfig: \(error.localizedDescription)")
            }
        }
    }

    var isConfigured: Bool {
        config != nil
    }

    func save(_ config: ServerConfig) throws {
        let data = try JSONEncoder().encode(config)
        userDefaults.set(data, forKey: StorageKey.Server.config)
        self.config = config
    }

    func reset() {
        userDefaults.removeObject(forKey: StorageKey.Server.config)
        config = nil
    }
}
