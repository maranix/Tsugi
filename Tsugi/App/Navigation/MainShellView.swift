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
    @Environment(ServerStore.self) private var serverStore

    @State private var tab: MainShellTab = .library
    @State private var mockBooksViewModel = MockBooksViewModel()
    @State private var showAddServerSheet = false

    var body: some View {
        if serverStore.isConfigured {
            TabView(selection: $tab) {
                Tab(
                    .generalLibrary,
                    systemImage: AppIcon.library,
                    value: .library
                ) {
                    NavigationStack {
                        LibraryView()
                    }
                }

                Tab(
                    .generalDiscover,
                    systemImage: AppIcon.browse,
                    value: .discover
                ) {
                    NavigationStack {
                        DiscoverView()
                    }
                }
            }
            .environment(mockBooksViewModel)
        } else {
            ContentUnavailableView {
                Label("No Server Connected", systemImage: AppIcon.server)
            } description: {
                Text(
                    "Connect your server to start browsing and reading your library"
                )
            } actions: {
                Button(.buttonAddServer) {
                    showAddServerSheet = true
                }.buttonStyle(.glassProminent)
            }
            .sheet(isPresented: $showAddServerSheet) {
                AddServerSheetView(serverStore)
            }
        }
    }
}
