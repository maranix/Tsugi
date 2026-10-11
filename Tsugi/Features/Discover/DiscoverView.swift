import SwiftUI

struct DiscoverView: View {
    @State private var router = NavigationRouter<AppRoute.Destination>()

    var body: some View {
        NavigationStack(path: $router.stack) {
            List {
                ForEach(0 ..< 99) { index in
                    Text("Item \(index)")
                }
            }
            .navigationTitle("Discover")
        }
    }
}
