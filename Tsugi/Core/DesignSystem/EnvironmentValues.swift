import SwiftUI

extension EnvironmentValues {
    @Entry var onboardingStorage: OnboardingStorage = DefaultOnboardingStore.shared
    @Entry var serverStorage: ServerStorage = DefaultServerStore.shared
    @Entry var serverHealthService: ServerHealthService = DefaultServerHealthService()
}
