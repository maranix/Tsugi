//
//  OnboardingServerConfigurationView.swift
//  Tsugi
//
//  Created by Raman Verma on 05/10/26.
//

import SwiftUI

struct OnboardingServerView: View {
    @Environment(OnboardingTabViewModel.self) var tabViewModel
    
    var mainTitle: some View {
        Text(Strings.General.your)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            VStack(alignment: .leading) {
                mainTitle

                HStack {
                    mainTitle
                        .hidden()
                        .accessibilityHidden(true)

                    VStack(alignment: .leading) {
                        HStack {
                            Text(Strings.General.privacy)
                            Image(systemName: AppIcon.privacy)
                                .foregroundStyle(.secondary)
                        }
                        HStack {
                            Text(Strings.General.library)
                            Image(systemName: AppIcon.library)
                                .foregroundStyle(.secondary)
                        }
                        HStack {
                            Text(Strings.General.control)
                            Image(systemName: AppIcon.control)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 16)

            Spacer()

            VStack(alignment: .leading, spacing: 12) {
                Text(Strings.Disclaimer.endorsments)

                Text(Strings.Disclaimer.privacy)

            }
            .font(.body)
            .fontWeight(.thin)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.secondary)

            Spacer()

            Text(Strings.Disclaimer.control)
            .font(.footnote)
            .fontWeight(.bold)
            .padding(.bottom, 24)
        }
        .padding()
    }
}
