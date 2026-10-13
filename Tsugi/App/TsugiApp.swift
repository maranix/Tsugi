//
//  TsugiApp.swift
//  Tsugi
//
//  Created by Raman Verma on 03/10/26.
//

import SwiftUI

@main
struct TsugiApp: App {
    @State private var preferences = AppPreferences.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(preferences)
        }
    }
}
