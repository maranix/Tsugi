//
//  OnboardingWelcomeView.swift
//  Tsugi
//
//  Created by Raman Verma on 05/10/26.
//

import SwiftUI

struct OnboardingWelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            VStack(alignment: .leading, spacing: 16) {
                Text("Tsugi")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(
                    "Seamlessly control your self-hosted Suwayomi instance to bring your entire catalog, reading history, offline downloads and more."
                )
                .font(.body)
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    OnboardingWelcomeView()
        .padding()
}
