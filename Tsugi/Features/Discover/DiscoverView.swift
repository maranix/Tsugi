import SwiftUI

struct DiscoverView: View {
    @State private var router = NavigationRouter<RouteCoordinator.Destination>()

    var body: some View {
        NavigationStack(path: $router.stack) {
            ServerContentView {
                ScrollView {
                    LazyVStack {
                        ForEach(0 ..< 99) { index in
                            Text("Item \(index)")
                        }
                    }
                }
                .navigationTitle("Discover")
            }
        }
    }
}
