import SwiftUI

enum AppRoute {
    enum Main: Hashable {
        case splash
        case homeShell
    }

    enum Sheet: String, Hashable, Identifiable {
        case onboarding
        case addServer
        case settings

        var id: String {
            rawValue
        }
    }

    enum Destination: Hashable {
        case item(index: Int)
    }
}

@MainActor
@Observable
final class MainRouter {
    private(set) var route: AppRoute.Main = .splash
    var sheet: AppRoute.Sheet?

    func push(_ dest: AppRoute.Main) {
        route = dest
    }

    func pushSheet(_ route: AppRoute.Sheet) {
        sheet = route
    }

    func popSheet() {
        sheet = nil
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
