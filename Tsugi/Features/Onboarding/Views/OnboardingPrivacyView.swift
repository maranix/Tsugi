//
//  OnboardingServerConfigurationView.swift
//  Tsugi
//
//  Created by Raman Verma on 05/10/26.
//

import SwiftUI

struct OnboardingPrivacyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            Grid(alignment: .leading, horizontalSpacing: 0, verticalSpacing: 0)
            {
                GridRow {
                    Text(.generalYour)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }

                GridRow {
                    Color
                        .clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])

                    HStack {
                        Text(.generalPrivacy)
                        Image(systemName: AppIcon.privacy)
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
                        Text(.generalLibrary)
                        Image(systemName: AppIcon.library)
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
                        Text(.generalControl)
                        Image(systemName: AppIcon.control)
                            .foregroundStyle(.secondary)
                            .accessibilityHidden(true)
                    }
                }
                .font(.title2)

            }

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
    }
}
