import SwiftUI

@MainActor
@Observable
final class BookContentViewModel {
    private let service: BookService

    let book: Book

    init(_ book: Book, service: BookService = SuwayomiService.shared) {
        self.service = service
        self.book = book
        self.content = .init(details: .init(), chapters: [])
        self.status = .idle
    }

    private(set) var status: AsyncStatus
    private(set) var content: BookContent

    func loadContent() async {
        status = .loading

        do {
            let fetched = try await service.getMangaAndChapters(id: book.id)
            self.content = fetched
            self.status = .success
        } catch {
            self.status = .failure(error.localizedDescription)
        }
    }

    func refreshContent() async {
        await loadContent()
    }
}
