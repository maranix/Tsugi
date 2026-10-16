import SwiftUI

@MainActor
@Observable
final class BookContentViewModel {
    private let service: BookService

    let book: Book

    init(_ book: Book, service: BookService = SuwayomiService.shared) {
        self.service = service
        self.book = book
        status = .idle
    }

    private(set) var status: AsyncStatus
    private(set) var content: BookContent?

    func loadContent() async {
        if status.isLoading {
            return
        }

        if content == nil {
            status = .loading
        }

        do {
            let fetched = try await service.getDetailsAndChapters(id: book.id)
            content = fetched
            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }

    func refreshContent() async {
        await loadContent()
    }
}
