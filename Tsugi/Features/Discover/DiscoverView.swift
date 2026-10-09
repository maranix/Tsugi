import SwiftUI

struct DiscoverView: View {
    @State private var router = NavigationRouter<AppRoute.Destination>()

    var body: some View {
        NavigationStack(path: $router.stack) {
            List {
                ForEach(0 ..< 99) { index in
                    NavigationLink(value: AppRoute.Destination.item(index: index)) {
                        Text("Item \(index)")
                    }
                }
            }
            .navigationTitle("Discover")
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
