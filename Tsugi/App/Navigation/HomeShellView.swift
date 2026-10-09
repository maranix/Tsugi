import SwiftUI

struct HomeShellView: View {
    @Environment(Router.self) private var router

    var body: some View {
        VStack {
            Text("Home")
                .font(.title)
                .fontWeight(.bold)
        }
    }
}
