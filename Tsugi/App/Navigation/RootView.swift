//
//  RootView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct RootView: View {
    @AppStorage(StorageKey.Onboarding.completed) private var isOnboarded = false

    @State private var router = Router()
    @State private var serverStorage: ServerStorage = ServerStore()

    var body: some View {
        ZStack {
            switch router.root {
            case .splash:
                Text("Tsugi")
                    .font(.title)
                    .fontWeight(.bold)
            case .homeShell:
                VStack {
                    Text("Home")
                        .font(.title)
                        .fontWeight(.bold)

                    Button("Reset Onboarding") {
                        withAnimation(.easeIn) {
                            router.pushRoot(.splash)
                            isOnboarded = false
                        }
                    }
                }
            }
        }
        .sheet(
            item: $router.sheet,
            onDismiss: { router.popSheet() },
            content: { sheet in
                switch sheet {
                case .onboarding:
                    OnboardingView(
                        onComplete: {
                            withAnimation(.easeIn) {
                                router.popSheet()
                                isOnboarded = true
                            }
                        }
                    )
                    .interactiveDismissDisabled()
                case .addServer:
                    AddServerSheetView(serverStorage)
                }
            }
        )
        .task(id: isOnboarded) {
            withAnimation(.easeIn(duration: 0.25)) {
                if isOnboarded {
                    router.pushRoot(.homeShell)
                } else {
                    router.pushSheet(.onboarding)
                }
            }
        }
        .environment(router)
    }
}
