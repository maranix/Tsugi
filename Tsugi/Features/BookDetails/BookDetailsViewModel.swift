import SwiftUI

@MainActor
@Observable
final class BookDetailsViewModel {
    private let bookService: BookService

    let book: Book

    var details: BookDetails?
    var status: AsyncStatus = .idle

    init(_ book: Book, using: BookService = SuwayomiService.shared) {
        self.book = book
        bookService = using
    }

    func getDetails() async {
        status = .loading

        do {
            details = try await bookService.getDetails(id: book.rawId)
            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }
}
