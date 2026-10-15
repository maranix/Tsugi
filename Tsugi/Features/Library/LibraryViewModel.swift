import SuwayomiAPI
import SwiftUI

@MainActor
@Observable
final class LibraryViewModel {
    let bookService: BookService

    init(_ service: BookService = SuwayomiService.shared) {
        bookService = service
    }

    private(set) var books: [Book] = []
    private(set) var status: AsyncStatus = .idle

    private(set) var hasMore: Bool = false
    private(set) var token: String?

    func get() async {
        if books.isEmpty {
            status = .loading
        }

        do {
            let page = PageRequest(token: token)
            let filter = BookFilter(inLibrary: true)

            let result = try await bookService.get(page: page, filter: filter)

            hasMore = result.hasMore
            token = result.nextToken

            books.append(contentsOf: result.items)
            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }

    func refresh() async {
        hasMore = false
        token = nil
        books = []

        await get()
    }
}
