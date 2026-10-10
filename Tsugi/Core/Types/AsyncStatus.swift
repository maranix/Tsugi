//
//  AsyncStatus.swift
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
