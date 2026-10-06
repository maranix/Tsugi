//
//  OnboardingView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct OnboardingPage: View {
    @State private var viewModel = OnboardingViewModel()

    @ViewBuilder
    private var content: some View {
        switch viewModel.currentStep {
        case .welcome:
            OnboardingWelcomeView()
        case .server:
            OnboardingServerView()
        }
    }

    var body: some View {
        VStack {
            OnboardingTopBar()

            ZStack {
                content
                    .id(viewModel.currentStep)
                    .transition(.slidingBlurReplace)
            }

            OnboardingBottomBar()
        }
        .sheet(isPresented: $viewModel.showAddServerSheet) {
            AddServerSheetView()
        }
        .environment(viewModel)
    }
}
