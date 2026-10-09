//
//  RootView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct RootView: View {
    @State private var router = MainRouter()
    @Environment(\.onboardingStorage) private var onboardingStorage

    var body: some View {
        ZStack {
            switch router.route {
            case .splash:
                SplashView()
            case .homeShell:
                HomeShellView()
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
                case .settings:
                    SettingsView()
                        .presentationDetents([.large])
                }
            }
        )
        .environment(router)
    }
}
