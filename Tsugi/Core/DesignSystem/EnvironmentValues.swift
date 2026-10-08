import SwiftUI

extension EnvironmentValues {
    @Entry var serverHealthService: ServerHealthService = DefaultServerHealthService()
}
