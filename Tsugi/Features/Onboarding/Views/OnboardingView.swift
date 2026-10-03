//
//  OnboardingView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(ServerStore.self) private var serverStore
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text("Onboarding")
                .font(.largeTitle)
            Button("Complete", role: .confirm) {
                serverStore.isConfigured = true
            }
            .buttonStyle(.glass)
            .controlSize(.large)
        }
    }
}
