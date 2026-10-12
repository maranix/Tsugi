import SwiftUI

struct SettingsView: View {
    @Environment(RouteCoordinator.self) private var coordinator

    private let store: ServerStorage

    init(_ store: ServerStorage = DefaultServerStore.shared) {
        self.store = store
    }

    func onResetAllSettings() {
        store.reset()
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Button("Reset All", role: .destructive) {
                    coordinator.presentAlert(
                        .reset(
                            message: "Are you sure you want to reset all to defaults?",
                            onConfirm: onResetAllSettings
                        )
                    )
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .navigationTitle("Settings")
        }
    }
}
