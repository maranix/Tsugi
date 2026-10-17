import Observation

@MainActor
@Observable
class ServerViewModel {
    private let service: ServerService

    private(set) var dashboard: ServerDashboard?

    init(_ service: ServerService = SuwayomiServer.shared) {
        self.service = service
    }

    func populateDashboard() async {
        dashboard = try? await service.getDashboard()
    }
}
