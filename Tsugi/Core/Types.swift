//
//  Types.swift
//  Tsugi
//
//  Created by Raman Verma on 07/10/26.
//

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

struct PageRequest: Sendable {
    let limit: Int
    let token: String?

    init(limit: Int = 20, token: String? = nil) {
        self.limit = limit
        self.token = token
    }
}

struct PageResult<Item: Sendable>: Sendable {
    let items: [Item]
    let hasMore: Bool
    let nextToken: String?

    init(items: [Item], hasMore: Bool, nextToken: String? = nil) {
        self.items = items
        self.hasMore = hasMore
        self.nextToken = nextToken
    }

    static func empty() -> Self {
        .init(items: [], hasMore: false)
    }
}

struct BookFilter: Sendable {
    var inLibrary: Bool?
    var sort: BookSort = .alphabetical(asc: true)
}

enum BookSort: Sendable {
    case alphabetical(asc: Bool)
    case dateAdded(asc: Bool)
    case dateUpdated(asc: Bool)
}
