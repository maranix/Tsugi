import SwiftUI

struct ServerContentView<Content: View>: View {
    @Environment(RouteCoordinator.self) private var coordinator

    @ViewBuilder
    private let content: Content

    @State
    private var isPresented: () -> Bool

    private let onPresentationChanged: (Bool) -> Void?

    init(
        isPresented: @escaping () -> Bool = { DefaultServerStore.shared.isConfigured },
        onPresentationChanged: @escaping (Bool) -> Void? = { _ in nil },
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.isPresented = isPresented
        self.onPresentationChanged = onPresentationChanged
    }

    var body: some View {
        content
            .overlay {
                if !isPresented() {
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
            .task(id: isPresented()) {
                onPresentationChanged(isPresented())
            }
    }
}
