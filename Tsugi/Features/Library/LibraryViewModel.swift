import SuwayomiAPI
import SwiftUI

@MainActor
@Observable
final class LibraryViewModel {
    private let mangaService: MangaService = DefaultMangaService()

    private(set) var books: [Book] = []
    private(set) var status: AsyncStatus = .idle

    func getAll() async {
        if books.isEmpty {
            status = .loading
        }

        do {
            books = try await mangaService.getAll(fromLibrary: true)
            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }
}
