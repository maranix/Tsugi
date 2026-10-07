//
//  TsugiApp.swift
//  Tsugi
//
//  Created by Raman Verma on 03/10/26.
//

import SwiftUI
import SwiftData

@main
struct TsugiApp: App {
    @State private var serverStore = ServerStore()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(serverStore)
        }
    }
}
