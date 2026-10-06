//
//  OnboardingWelcomeView.swift
//  Tsugi
//
//  Created by Raman Verma on 05/10/26.
//

import SwiftUI

struct OnboardingWelcomeView: View {
    @Environment(OnboardingTabViewModel.self) private var tabViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            VStack(alignment: .leading, spacing: 16) {
                Text(Strings.General.appTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(Strings.Onboarding.welcomeSubtitle)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}
