import SwiftUI

struct ServerContentView<Content: View>: View {
    @Environment(AppPreferences.self) private var preferences
    @Environment(RouteCoordinator.self) private var coordinator

    @ViewBuilder
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var isServerConfigured: Bool {
        preferences.serverUrl != nil
    }

    var body: some View {
        content
            .overlay {
                if !isServerConfigured {
                    ContentUnavailableView {
                        Label("No Server Configured", systemImage: SFSymbol.server)
                    } description: {
                        Text("Connect to a server to browse and download your library.")
                    } actions: {
                        Button("Add Server") {
                            coordinator.presentSheet(.addServer)
                        }
                        .controlSize(.regular)
                        .buttonStyle(.borderedProminent)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.background)
                }
            }
    }
}
