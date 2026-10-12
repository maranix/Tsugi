//
//  RootView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct RootView: View {
    @State private var coordinator = RouteCoordinator()

    var body: some View {
        HomeShellView()
            .fullScreenCover(
                item: $coordinator.presentedCover,
                content: { cover in
                    switch cover {
                    case .onboarding:
                        OnboardingView(
                            onComplete: {
                                withAnimation(.easeIn) {
                                    coordinator.completeOnboarding()
                                }
                            }
                        )
                    }
                }
            )
            .sheet(
                item: $coordinator.presentedSheet,
                content: { sheet in
                    switch sheet {
                    case .addServer:
                        AddServerSheetView()
                    case .settings:
                        SettingsView()
                            .presentationDetents([.large])
                    }
                }
            )
            .alert(
                "",
                isPresented: Binding(
                    get: { coordinator.presentedAlert != nil },
                    set: {
                        if !$0 {
                            coordinator.presentedAlert = nil
                        }
                    }),
                presenting: coordinator.presentedAlert
            ) { alert in
                switch alert {
                case .error:
                    Button("OK", role: .cancel, action: {})
                case let .reset(_, onConfirm):
                    Button("Cancel", role: .cancel, action: {})
                    Button("Reset", role: .destructive, action: onConfirm)
                }
            } message: { alert in
                switch alert {
                case let .reset(message, _):
                    Text(message)
                case let .error(message):
                    Text(message)
                }
            }
            .environment(coordinator)
    }
}
