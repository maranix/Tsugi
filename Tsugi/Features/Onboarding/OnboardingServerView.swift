//
//  OnboardingServerConfigurationView.swift
//  Tsugi
//
//  Created by Raman Verma on 05/10/26.
//

import SwiftUI

struct OnboardingServerView: View {
    @Environment(TabViewModel.self) var tabViewModel: TabViewModel
    
    var mainTitle: some View {
        Text(Strings.General.your)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                withAnimation {
                    tabViewModel.previousPage()
                }
            } label: {
                Image(systemName: AppIcon.previous)
                    .font(.title2)
                    .padding(.all, 12)
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)

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
