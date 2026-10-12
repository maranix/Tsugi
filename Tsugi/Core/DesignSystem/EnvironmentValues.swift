import SwiftUI

extension EnvironmentValues {
    @Entry var serverStorage: ServerStorage = DefaultServerStore.shared
    @Entry var serverHealthService: ServerHealthService = DefaultServerHealthService()
}
