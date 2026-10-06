//
//  MainShellView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

enum MainShellTab: Hashable {
    case library
    case discover
}

struct MainShellView: View {
    @State private var tab: MainShellTab = .library
    @State private var mockBooksViewModel = MockBooksViewModel()

    var body: some View {
        TabView(selection: $tab) {
            Tab(Strings.General.library, systemImage: AppIcon.library, value: .library) {
                NavigationStack {
                    LibraryView()
                }
            }
            
            Tab(Strings.General.discover, systemImage: AppIcon.browse, value: .discover) {
                NavigationStack {
                    DiscoverView()
                }
            }
        }.environment(mockBooksViewModel)
    }
}
