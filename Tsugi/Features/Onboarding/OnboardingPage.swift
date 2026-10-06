//
//  OnboardingView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct OnboardingPage: View {
    @State private var viewModel = TabViewModel(max: 2)

    @ViewBuilder
    private var content: some View {
        switch viewModel.currentPage {
        case 0:
            OnboardingWelcomeView()
        case 1:
            OnboardingServerView()
        default:
            Text("These aren't the droids you're looking for")
        }
    }

    var body: some View {
        VStack {
            ZStack {
                content
                    .id(viewModel.currentPage)
                    .transition(.slidingBlurReplace)
            }
            
            HStack {
                if viewModel.isActive(page: 1) {
                    Button(action: {}) {
                        Label(Strings.Button.addServer, systemImage: AppIcon.plus)
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

                Button {
                    withAnimation {
                        viewModel.nextPage()
                    }
                } label: {
                    Image(systemName: AppIcon.next)
                        .font(.title2)
                        .padding(.all, 12)
                }
                .buttonStyle(.glassProminent)
                .buttonBorderShape(.circle)
            }
            .padding()
            .animation(.snappy, value: viewModel.currentPage)
        }
        .environment(viewModel)
    }
}
