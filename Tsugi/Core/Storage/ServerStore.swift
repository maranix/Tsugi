//
//  ServerStore.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import Foundation

@MainActor
@Observable
final class ServerStore {
    private let userDefaults: UserDefaults

    private(set) var config: ServerConfig?

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults

        if let configData = userDefaults.data(forKey: StorageKey.Server.config)
        {
            do {
                self.config = try JSONDecoder().decode(
                    ServerConfig.self,
                    from: configData
                )
            } catch {
                // Saved data is currupted, better to clear it out
                userDefaults.removeObject(forKey: StorageKey.Server.config)
                debugPrint(error.localizedDescription)
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
