//
//  OnboardingTopbar.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

struct OnboardingTopBar: View {
    @Environment(OnboardingViewModel.self) private var viewModel

    var body: some View {
        HStack {
            if viewModel.canGoPrevious {
                Button {
                    viewModel.goPrevious()
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
    }
}
