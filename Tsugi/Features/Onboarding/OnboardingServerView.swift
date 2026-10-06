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
        Text(.generalYour)
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
                            Text(.generalPrivacy)
                            Image(systemName: AppIcon.privacy)
                                .foregroundStyle(.secondary)
                        }
                        HStack {
                            Text(.generalLibrary)
                            Image(systemName: AppIcon.library)
                                .foregroundStyle(.secondary)
                        }
                        HStack {
                            Text(.generalControl)
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
                Text(.disclaimerEndorsments)
                Text(.disclaimerPrivacy)

            }
            .font(.body)
            .fontWeight(.thin)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.secondary)

            Spacer()

            Text(.disclaimerControl)
            .font(.footnote)
            .fontWeight(.bold)
            .padding(.bottom, 24)
        }
        .padding()
    }
}
