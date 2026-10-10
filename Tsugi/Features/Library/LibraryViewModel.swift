import SuwayomiAPI
import SwiftUI

@MainActor
@Observable
final class LibraryViewModel {
    private let service: LibraryService

    init(_ storage: ServerStorage = DefaultServerStore.shared) {
        service = DefaultLibraryService(serverStorage: storage)
        searchText = ""
    }

    private(set) var allManga: [Manga] = []
    private(set) var status: AsyncStatus = .idle
    var searchText: String = ""

    var mangas: [Manga] {
        if searchText.trimmingCharacters(in: .whitespaces).isEmpty {
            allManga
        } else {
            allManga.filter { manga in
                manga.title.contains(searchText)
            }
        }
    }

    func getAll(force: Bool = false) async {
        guard force || status.isIdle else {
            return
        }

        status = .loading

        do {
            allManga = try await service.getAll()
            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }
}
