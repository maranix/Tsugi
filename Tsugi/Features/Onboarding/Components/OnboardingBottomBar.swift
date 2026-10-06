//
//  OnboardingBottombar.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

struct OnboardingBottomBar: View {
    @Environment(OnboardingViewModel.self) private var viewModel

    var body: some View {
        HStack {
            if viewModel.showAddServerButton {
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
                    viewModel.goNext()
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
    }
}
