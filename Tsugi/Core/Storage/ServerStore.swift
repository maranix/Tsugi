//
//  ServerConfigStore.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import Foundation
import SwiftData

@Observable
final class ServerStore {
    private let urlKey = "url"
    private let isConfiguredKey = "is_configured"
    
    init() {
        self.url = UserDefaults.standard.string(forKey: urlKey) ?? ""
        self.isConfigured = UserDefaults.standard.bool(forKey: isConfiguredKey)
    }
    
    var url: String {
        didSet {
            UserDefaults.standard.set(url, forKey: urlKey)
        }
    }
    
    var isConfigured: Bool {
        didSet {
            UserDefaults.standard.set(isConfigured, forKey: isConfiguredKey)
        }
    }
    
    func reset() {
        url = ""
        isConfigured = false
    }
}
