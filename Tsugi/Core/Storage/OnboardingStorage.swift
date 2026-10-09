import SwiftUI

@MainActor
protocol OnboardingStorage {
    var onboarded: Bool { get }

    func setOnboarded(_ value: Bool)
}

@MainActor
@Observable
final class DefaultOnboardingStore: OnboardingStorage {
    static let shared = DefaultOnboardingStore()

    private let userDefaults: UserDefaults

    private(set) var onboarded: Bool {
        didSet {
            userDefaults.set(onboarded, forKey: StorageKey.Onboarding.onboarded)
        }
    }

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        onboarded = userDefaults.bool(forKey: StorageKey.Onboarding.onboarded)
    }

    func setOnboarded(_ value: Bool) {
        onboarded = value
    }
}
