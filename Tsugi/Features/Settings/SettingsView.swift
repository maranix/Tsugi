import SwiftUI

struct SettingsView: View {
    @Environment(RouteCoordinator.self) private var coordinator

    private let storage: ServerStorage

    init(_ storage: ServerStorage = AppPreferences.shared) {
        self.storage = storage
    }

    func onResetAllSettings() {
        storage.setServerUrl(nil)
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
