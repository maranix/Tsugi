//
//  OnboardingView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

enum OnboardingStep: Int, CaseIterable {
    case welcome
    case server
}

typealias OnboardingTabViewModel = TabViewModel<OnboardingStep>

struct OnboardingPage: View {
    @State private var viewModel = OnboardingTabViewModel(.welcome)

    @ViewBuilder
    private var content: some View {
        switch viewModel.currentPage {
        case .welcome:
            OnboardingWelcomeView()
        case .server:
            OnboardingServerView()
        }
    }

    var body: some View {
        VStack {
            HStack {
                if viewModel.canGoPrevious {
                    Button {
                        withAnimation {
                            viewModel.goPrevious()
                        }
                    } label: {
                        Image(systemName: AppIcon.previous)
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
                    .accessibilityLabel(.accessibilityPreviousPage)
                }

                Spacer()
            }
            .padding()
            .animation(.snappy, value: viewModel.currentPage)

            ZStack {
                content
                    .id(viewModel.currentPage)
                    .transition(.slidingBlurReplace)
            }

            HStack {
                if viewModel.isActive(.server) {
                    Button(action: {}) {
                        Label(
                            .buttonAddServer,
                            systemImage: AppIcon.plus
                        )
                    }
                    .buttonStyle(.glass)
                    .controlSize(.extraLarge)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .opacity
                        )
                    )
                }

                Spacer()

                if viewModel.canGoNext {
                    Button {
                        withAnimation {
                            viewModel.goNext()
                        }
                    } label: {
                        Image(systemName: AppIcon.next)
                            .font(.title2)
                            .padding(.all, 12)
                    }
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.circle)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .opacity
                        )
                    )
                    .accessibilityLabel(.accessibilityNextPage)
                }

            }
            .padding()
            .animation(.snappy, value: viewModel.currentPage)
        }
        .environment(viewModel)
    }
}
