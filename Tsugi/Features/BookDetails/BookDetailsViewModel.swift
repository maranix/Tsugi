import SwiftUI

@MainActor
@Observable
final class BookDetailsViewModel {
    private let bookService: BookService

    let book: Book

    private(set) var details: BookDetails?
    private(set) var chapters = [BookChapter]()

    private(set) var status: AsyncStatus = .idle
    private(set) var chapterStatus: AsyncStatus = .idle

    private(set) var hasNext = false
    private var nextToken: String?

    init(_ book: Book, using: BookService = SuwayomiService.shared) {
        self.book = book
        bookService = using
    }

    func getDetails() async {
        status = .loading

        do {
            let id = book.rawId

            details = try await bookService.getDetails(id: id)

            let chapData = try await bookService.getChapters(id: id, page: .init(), filter: .init())

            chapters = chapData.items
            hasNext = chapData.hasMore
            nextToken = chapData.nextToken

            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }

    func loadMoreChapters() async {
        guard hasNext, let token = nextToken else {
            return
        }
        chapterStatus = .loading

        do {
            let data = try await bookService.getChapters(
                id: book.rawId,
                page: .init(token: token),
                filter: .init()
            )

            chapters.append(contentsOf: data.items)
            hasNext = data.hasMore
            nextToken = data.nextToken

            chapterStatus = .success
        } catch {
            chapterStatus = .failure(error.localizedDescription)
        }
    }
}
