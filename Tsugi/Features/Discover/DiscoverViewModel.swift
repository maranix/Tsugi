import Foundation
import Observation

@MainActor
@Observable
final class DiscoverViewModel {
    init(_ service: BookService = SuwayomiService.shared) {
        self.service = service

        status = .idle
        hasMore = false
        sources = []
        sourceIdToBookListDict = [:]
    }

    private let service: BookService

    private(set) var status: AsyncStatus
    private(set) var sources: [BookSource]
    private(set) var sourceIdToBookListDict: [String: [Book]]

    private(set) var hasMore: Bool
    private(set) var nextToken: String?

    func get() async {
        hasMore = false
        nextToken = nil
        sources = []

        status = .loading

        do {
            let result = try await service.getSources(first: 20, after: nextToken)

            hasMore = result.hasMore
            nextToken = result.nextCursor
            sources = result.items

            status = .success
        } catch {
            status = .failure(error.localizedDescription)
        }
    }

    func loadNext() async {
        guard hasMore, let cursor = nextToken else {
            return
        }

        guard let result = try? await service.getSources(first: 20, after: cursor) else {
            return
        }

        hasMore = result.hasMore
        nextToken = result.nextCursor
        sources.append(contentsOf: result.items)
    }

    func loadBookListFromSource(id: String) async {
        if sourceIdToBookListDict[id] != nil {
            return
        }

        guard let result = try? await service.getBookListFromSource(id: id, page: 1) else {
            return
        }

        sourceIdToBookListDict[id] = result.items
    }
}
