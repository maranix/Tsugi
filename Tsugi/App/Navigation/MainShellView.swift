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
    @State private var showAddServerSheet = false

    var body: some View {
        if serverStore.isConfigured {
            TabView(selection: $tab) {
                Tab(
                    "Library",
                    systemImage: SFSymbol.library,
                    value: .library
                ) {
                    NavigationStack {
                        LibraryView()
                    }
                }

                Tab(
                    "Discover",
                    systemImage: SFSymbol.browse,
                    value: .discover
                ) {
                    NavigationStack {
                        DiscoverView()
                    }
                }
            }
        } else {
            ContentUnavailableView {
                Label("No Server Connected", systemImage: SFSymbol.server)
            } description: {
                Text(
                    "Connect your server to start browsing and reading your library"
                )
            } actions: {
                Button("Add Server") {
                    showAddServerSheet = true
                }
                .buttonStyle(.glassProminent)
            }
            .sheet(isPresented: $showAddServerSheet) {
                AddServerSheetView(serverStore)
            }
        }
    }
}

#Preview {
    MainShellView()
        .environment(ServerStore())
}
