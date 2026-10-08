//
//  OnboardingPage.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct OnboardingPage: View {
    private let onComplete: () -> Void

    init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }

    @State private var viewModel = OnboardingViewModel()

    @ViewBuilder
    private var content: some View {
        switch viewModel.currentStep {
        case .welcome:
            OnboardingWelcomeView()
        case .privacy:
            OnboardingPrivacyView()
        }
    }

    var body: some View {
        VStack {
            HStack {
                if viewModel.canGoPrevious {
                    Button {
                        viewModel.goPrevious()
                    } label: {
                        Image(systemName: SFSymbol.previous)
                            .font(.title2)
                            .padding(.all, 12)
                    }
                    .buttonStyle(.glass)
                    .buttonBorderShape(.circle)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .opacity
                        )
                    )
                    .accessibilityLabel("Previous Page")
                }

                Spacer()
            }

            ZStack {
                content
                    .id(viewModel.currentStep)
                    .transition(.slidingBlurReplace)
            }

            HStack {
                Spacer()

                if viewModel.canGoNext {
                    Button {
                        viewModel.goNext()
                    } label: {
                        Image(systemName: SFSymbol.next)
                            .font(.title2)
                            .padding(.all, 12)
                    }
                    .tint(.green)
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.circle)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .opacity
                        )
                    )
                    .accessibilityLabel("Next Page")
                } else {
                    Button("Start Reading") {
                        onComplete()
                    }
                    .tint(.green)
                    .buttonStyle(.glassProminent)
                    .controlSize(.extraLarge)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .opacity
                        )
                    )
                    .accessibilityLabel("Complete Onboarding")
                }
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingPage(onComplete: {})
}
