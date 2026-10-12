import SwiftUI

@MainActor
@Observable
final class RouteCoordinator {
    enum Destination: Hashable {
        case bookDetails(_ book: Book)
    }

    enum FullScreenCover: Identifiable {
        case onboarding

        var id: Self {
            self
        }
    }

    enum Sheet: Identifiable {
        case addServer
        case settings

        var id: Self {
            self
        }
    }

    enum Alert: Identifiable {
        case resetAllSettings(onConfirm: () -> Void)
        case error(String)

        var id: String {
            switch self {
            case .resetAllSettings:
                "resetAllSettings"
            case .error:
                "error"
            }
        }
    }

    private let onboardingStorage: OnboardingStorage

    var presentedSheet: Sheet?
    var presentedCover: FullScreenCover?
    var presentedAlert: Alert?

    init(onboarding: OnboardingStorage = DefaultOnboardingStore.shared) {
        onboardingStorage = onboarding

        if !onboardingStorage.onboarded {
            presentedCover = .onboarding
        }
    }

    func presentSheet(_ sheet: Sheet) {
        presentedSheet = sheet
    }

    func presentCover(_ cover: FullScreenCover) {
        presentedCover = cover
    }

    func presentAlert(_ alert: Alert) {
        presentedAlert = alert
    }

    func completeOnboarding() {
        onboardingStorage.setOnboarded(true)
        presentedCover = nil
    }
}

@MainActor
@Observable
final class NavigationRouter<Destination: Hashable> {
    var stack: [Destination] = []

    func push(_ dest: Destination) {
        stack.append(dest)
    }

    func pop() {
        _ = stack.removeLast()
    }
}
