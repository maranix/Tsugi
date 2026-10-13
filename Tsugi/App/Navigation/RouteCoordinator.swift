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
        case reset(message: String, onConfirm: () -> Void)
        case error(String)

        var id: String {
            switch self {
            case let .reset(message, _):
                "reset-\(message)"
            case .error:
                "error"
            }
        }
    }

    private let storage: OnboardingStorage

    var presentedSheet: Sheet?
    var presentedCover: FullScreenCover?
    var presentedAlert: Alert?

    init(storage: OnboardingStorage = AppPreferences.shared) {
        self.storage = storage

        if !self.storage.isOnboarded() {
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
        storage.markOnboarded()
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
