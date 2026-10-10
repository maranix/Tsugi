import SwiftUI

struct LibraryView: View {
    @Environment(MainRouter.self) private var mainRouter
    @State private var router = NavigationRouter<AppRoute.Destination>()
    @State private var searchText = ""

    var body: some View {
        NavigationStack(path: $router.stack) {
            List {
                ForEach(0 ..< 99) { index in
                    NavigationLink(value: AppRoute.Destination.item(index: index)) {
                        Text("Item \(index)")
                    }
                }
            }
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        mainRouter.pushSheet(.settings)
                    } label: {
                        Image(systemName: SFSymbol.settings)
                    }
                }

                ToolbarSpacer(.flexible, placement: .bottomBar)
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
            }
            .searchable(text: $searchText)
            .searchToolbarBehavior(.minimize)
            .navigationDestination(for: AppRoute.Destination.self) { dest in
                switch dest {
                case let .item(index):
                    Text("Item Page")
                        .navigationTitle("Item \(index)")
                }
            }
        }
    }
}
