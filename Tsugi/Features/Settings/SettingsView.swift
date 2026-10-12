import SwiftUI

struct SettingsView: View {
    @Environment(RouteCoordinator.self) private var coordinator

    private let store: ServerStorage

    init(_ store: ServerStorage = DefaultServerStore()) {
        self.store = store
    }

    func onResetAllSettings() {
        store.reset()
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Button("Reset All Settings", role: .destructive) {
                    coordinator.presentAlert(
                        .resetAllSettings(onConfirm: onResetAllSettings)
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
