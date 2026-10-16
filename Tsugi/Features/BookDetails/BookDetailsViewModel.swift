import SwiftUI

private enum LoadContentStep: Sendable {
    case details(Book.Details?)
    case chapters(PageResult<Book.Chapter>)
}

@MainActor
@Observable
final class BookDetailsViewModel {
    private let service: BookService

    let book: Book

    init(_ book: Book, using: BookService = SuwayomiService.shared) {
        service = using
        self.book = book
        content = .init()
        status = .idle
        hasNext = false
    }

    private(set) var status: AsyncStatus
    private(set) var content: Book.Content

    private(set) var hasNext: Bool
    private(set) var nextToken: String?

    func loadContent() async {
        status = .loading

        let id = book.rawId

        do {
            try await withThrowingTaskGroup(of: LoadContentStep.self) { group in
                group.addTask {
                    let details = try await self.service.getDetails(id: id)
                    return .details(details)
                }

                group.addTask {
                    let chapters = try await self.service.getChapters(id: id, page: .init(), filter: .init())
                    return .chapters(chapters)
                }

                for try await step in group {
                    switch step {
                    case let .details(details):
                        self.content.details = details
                    case let .chapters(pageResult):
                        self.content.chapters = pageResult.items
                        hasNext = pageResult.hasMore
                        nextToken = pageResult.nextToken
                    }
                }
            }

            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }

    func refreshContent() async {
        await loadContent()
    }

    func loadMoreChapters() async {
        guard hasNext, let token = nextToken else {
            return
        }

        guard let data = try? await service.getChapters(
            id: book.rawId,
            page: .init(token: token),
            filter: .init()
        ) else {
            return
        }

        content.chapters.append(contentsOf: data.items)
        hasNext = data.hasMore
        nextToken = data.nextToken
    }
}
