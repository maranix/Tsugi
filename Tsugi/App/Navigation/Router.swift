import SwiftUI

enum AppRoute: Hashable {
    enum Root: String, Hashable, Identifiable {
        case splash
        case homeShell

        var id: String {
            rawValue
        }
    }

    enum Sheet: String, Hashable, Identifiable {
        case onboarding
        case addServer

        var id: String {
            rawValue
        }
    }
}

@MainActor
@Observable
final class Router {
    var stack: [AppRoute] = []

    var root: AppRoute.Root = .splash
    var sheet: AppRoute.Sheet?

    func pushRoot(_ route: AppRoute.Root) {
        root = route
    }

    func pushSheet(_ route: AppRoute.Sheet) {
        sheet = route
    }

    func popSheet() {
        sheet = nil
    }

    func pop() {
        _ = stack.popLast()
    }
}
