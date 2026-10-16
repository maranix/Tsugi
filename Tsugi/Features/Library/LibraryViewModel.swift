import SuwayomiAPI
import SwiftUI

@MainActor
@Observable
final class LibraryViewModel {
    let service: BookService

    init(_ service: BookService = SuwayomiService.shared) {
        self.service = service
    }

    private(set) var books: [Book] = []

    private(set) var status: AsyncStatus = .idle
    private(set) var pageStatus: AsyncStatus = .idle

    private(set) var hasMore: Bool = false
    private(set) var nextCursor: String?

    func get() async {
        hasMore = false
        nextCursor = nil
        books = []

        do {
            let result = try await service.getLibrary(first: 20, after: nextCursor)

            hasMore = result.hasMore
            nextCursor = result.nextCursor
            books.append(contentsOf: result.items)

            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }

    func loadNext() async {
        guard hasMore, !pageStatus.isLoading, let cursor = nextCursor else {
            return
        }

        pageStatus = .loading

        do {
            let result = try await service.getLibrary(first: 20, after: cursor)

            hasMore = result.hasMore
            nextCursor = result.nextCursor
            books.append(contentsOf: result.items)

            pageStatus = .success
        } catch {
            pageStatus = .failure(error.localizedDescription)
        }
    }
}
