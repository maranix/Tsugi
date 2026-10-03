//
//  MainShellView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

enum MainShellTab: Hashable {
    case library
    case browse
    case settings
}

struct MainShellView: View {
    @State private var tab: MainShellTab = .library
    
    var body: some View {
        TabView(selection: $tab) {
            Tab("Library", systemImage: "books.vertical", value: .library) {
                NavigationStack {
                    Text("Library Screen")
                        .navigationTitle("Library")
                        .font(.headline)
                }
            }
            
            Tab("Browse", systemImage: "magnifyingglass", value: .browse) {
                NavigationStack {
                    Text("Browse Screen")
                        .navigationTitle("Browse")
                        .font(.headline)
                }
            }
            
            Tab("Settings", systemImage: "gearshape", value: .settings) {
                NavigationStack {
                    Text("Settings Screen")
                        .navigationTitle("Settings")
                        .font(.headline)
                }
            }
        }
    }
}
