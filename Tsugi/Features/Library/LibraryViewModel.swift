import SuwayomiAPI
import SwiftUI

@MainActor
@Observable
final class LibraryViewModel {
    private let service: LibraryService

    init(_ storage: ServerStorage = DefaultServerStore.shared) {
        service = DefaultLibraryService(serverStorage: storage)
    }

    private(set) var mangas: [LibraryQuery.Data.Mangas.Node] = []
    private(set) var status: AsyncStatus = .idle

    var searchText = ""

    func getAll() async {
        status = .loading

        do {
            mangas = try await service.get()
            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }
}
