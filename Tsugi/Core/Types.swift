//
//  Types.swift
//  Tsugi
//
//  Created by Raman Verma on 07/10/26.
//

import Foundation

enum AsyncStatus {
    case idle
    case loading
    case success
    case failure(String)

    var isIdle: Bool {
        if case .idle = self {
            return true
        }
        return false
    }

    var isLoading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }

    var isSuccess: Bool {
        if case .success = self {
            return true
        }
        return false
    }

    var isFailure: Bool {
        if case .failure = self {
            return true
        }
        return false
    }

    var failureMessage: String? {
        guard case let .failure(message) = self else { return nil }
        return message
    }
}

struct BookContent: Hashable, Sendable {
    let details: BookDetails
    let chapters: [BookChapter]

    init(details: BookDetails, chapters: [BookChapter] = []) {
        self.details = details
        self.chapters = chapters
    }
}

struct PagedResult<Item: Sendable>: Sendable {
    let items: [Item]
    let hasMore: Bool
    let nextCursor: String?

    init(items: [Item], hasMore: Bool, nextCursor: String? = nil) {
        self.items = items
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }

    static func empty() -> Self {
        .init(items: [], hasMore: false, nextCursor: nil)
    }
}
