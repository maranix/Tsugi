import Foundation
import Observation

protocol OnboardingStorage {
    func isOnboarded() -> Bool
    func markOnboarded()
}

protocol ServerStorage {
    func getServerUrl() -> URL?
    func setServerUrl(_ url: URL?)
}

@MainActor
@Observable
final class AppPreferences: OnboardingStorage, ServerStorage {
    static let shared = AppPreferences()

    private let storage: UserDefaults

    init(with defaults: UserDefaults? = nil) {
        storage = defaults ?? UserDefaults()
        storage.register(defaults: defaultPreferences())

        serverUrl = getServerUrl()
    }

    var serverUrl: URL?

    func isOnboarded() -> Bool {
        storage.bool(forKey: StorageKey.onboarded)
    }

    func markOnboarded() {
        storage.set(true, forKey: StorageKey.onboarded)
    }

    func getServerUrl() -> URL? {
        storage.url(forKey: StorageKey.server)
    }

    func setServerUrl(_ url: URL?) {
        storage.set(url, forKey: StorageKey.server)
        serverUrl = url
    }

    func defaultPreferences() -> [String: Any] {
        [
            StorageKey.onboarded: false,
        ]
    }
}
