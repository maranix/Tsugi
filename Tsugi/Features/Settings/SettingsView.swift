import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0 ..< 100, id: \.self) { index in
                    Text("Item \(index)")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
