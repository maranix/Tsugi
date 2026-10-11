import SwiftUI

@MainActor
@Observable
final class BookDetailsViewModel {
    let book: Book

    var details: BookDetails.Suwayomi?
    var status: AsyncStatus = .idle

    init(book: Book) {
        self.book = book
    }

    func getDetails(using service: MangaService) async {
        status = .loading

        do {
            details = try await service.getDetails(id: book.id)
            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }
}
