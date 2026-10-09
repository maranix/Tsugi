//
//  RootView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct RootView: View {
    @State private var router = Router()
    @Environment(\.onboardingStorage) private var onboardingStorage

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
                            onboardingStorage.setOnboarded(false)
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
                                onboardingStorage.setOnboarded(true)
                            }
                        }
                    )
                    .interactiveDismissDisabled()
                case .addServer:
                    AddServerSheetView()
                }
            }
        )
        .task(id: onboardingStorage.onboarded) {
            withAnimation(.easeIn(duration: 0.25)) {
                if onboardingStorage.onboarded {
                    router.pushRoot(.homeShell)
                } else {
                    router.pushSheet(.onboarding)
                }
            }
        }
        .environment(router)
    }
}
