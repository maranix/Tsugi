import SwiftUI

@MainActor
protocol OnboardingStorage {
    var onboarded: Bool { get set }
}

@MainActor
@Observable
final class OnboardingStore: OnboardingStorage {
    private let userDefaults: UserDefaults

    var onboarded: Bool {
        didSet {
            userDefaults.set(onboarded, forKey: StorageKey.Onboarding.onboarded)
        }
    }

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        onboarded = userDefaults.bool(forKey: StorageKey.Onboarding.onboarded)
    }
}
