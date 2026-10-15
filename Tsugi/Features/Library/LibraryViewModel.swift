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
    private(set) var pageStatus: AsyncStatus = .idle

    private(set) var hasMore: Bool = false
    private(set) var nextToken: String?

    func get() async {
        hasMore = false
        nextToken = nil
        books = []

        do {
            let result = try await bookService.get(
                page: .init(),
                filter: .init(inLibrary: true)
            )

            hasMore = result.hasMore
            nextToken = result.nextToken
            books.append(contentsOf: result.items)

            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }

    func loadNext() async {
        guard hasMore, !pageStatus.isLoading, let token = nextToken else {
            return
        }

        pageStatus = .loading

        do {
            let page = PageRequest(token: token)
            let filter = BookFilter(inLibrary: true)

            let result = try await bookService.get(page: page, filter: filter)

            hasMore = result.hasMore
            nextToken = result.nextToken
            books.append(contentsOf: result.items)

            pageStatus = .success
        } catch {
            pageStatus = .failure(error.localizedDescription)
        }
    }
}
