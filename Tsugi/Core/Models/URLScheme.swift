//
//  URLScheme.swift
//  Tsugi
//
//  Created by Raman Verma on 07/10/26.
//

import Foundation

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
