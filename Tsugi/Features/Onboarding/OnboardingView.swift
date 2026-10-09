//
//  OnboardingView.swift
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
            WelcomeView()
        case .privacy:
            PrivacyView()
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

private struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            VStack(alignment: .leading, spacing: 16) {
                Text("Tsugi")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(
                    "Seamlessly control your self-hosted Suwayomi instance to " +
                        "bring your entire catalog, reading history, offline downloads and more."
                )
                .font(.body)
                .foregroundStyle(.secondary)
            }
        }
    }
}

private struct PrivacyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            Grid(alignment: .leading, horizontalSpacing: 0, verticalSpacing: 0) {
                GridRow {
                    Text("Your")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }

                GridRow {
                    Color
                        .clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])

                    HStack {
                        Text("Privacy")
                        Image(systemName: SFSymbol.privacy)
                            .foregroundStyle(.secondary)
                            .accessibilityHidden(true)
                    }
                }
                .font(.title2)

                GridRow {
                    Color
                        .clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])

                    HStack {
                        Text("Library")
                        Image(systemName: SFSymbol.library)
                            .foregroundStyle(.secondary)
                            .accessibilityHidden(true)
                    }
                }
                .font(.title2)

                GridRow {
                    Color
                        .clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])

                    HStack {
                        Text("Control")
                        Image(systemName: SFSymbol.control)
                            .foregroundStyle(.secondary)
                            .accessibilityHidden(true)
                    }
                }
                .font(.title2)
            }

            Spacer()

            VStack(alignment: .leading, spacing: 12) {
                Text(
                    "Tsugi does not contain, bundle, or endorse third-party ad services and tracking analytics. " +
                        "Your reading habits belong strictly to you."
                )
                Text(
                    "Every request, image stream, from bookmarked series to your page progress and chapter download " +
                        "is a direct handshake between your device and your hosted server."
                )
            }
            .font(.body)
            .fontWeight(.thin)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.secondary)

            Spacer()

            Text(
                "Tsugi has no control over network activity, external source extensions, " +
                    "or logs maintained on your server."
            )
            .font(.footnote)
            .fontWeight(.bold)
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    OnboardingPage(onComplete: {})
}
