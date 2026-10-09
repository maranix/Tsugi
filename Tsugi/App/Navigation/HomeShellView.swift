import SwiftUI

private enum ShellTab: Hashable {
    case library
    case discover
    case search
}

struct HomeShellView: View {
    @State private var selectedTab: ShellTab = .library

    var body: some View {
        TabView(selection: $selectedTab) {
            TabSection("Collection") {
                Tab("Library", systemImage: SFSymbol.library, value: ShellTab.library) {
                    LibraryView()
                }

                Tab("Discover", systemImage: SFSymbol.browse, value: ShellTab.discover) {
                    DiscoverView()
                }
            }

            Tab(
                "Search",
                systemImage: SFSymbol.search,
                value: ShellTab.search,
                role: .search
            ) {
                SearchView()
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}
