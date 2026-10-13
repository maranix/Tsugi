//
//  Constants.swift
//  Tsugi
//
//  Created by Raman Verma on 07/10/26.
//

enum URLScheme: String, CaseIterable, Identifiable, Sendable {
    case http
    case https

    var id: String {
        rawValue
    }

    var prefix: String {
        "\(rawValue)://"
    }

    var displayName: String {
        rawValue.uppercased()
    }
}

enum StorageKey {
    static let onboarded = "onboarding.onboarded"
    static let server = "server"
}
