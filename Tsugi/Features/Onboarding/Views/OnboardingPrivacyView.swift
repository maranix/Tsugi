//
//  OnboardingPrivacyView.swift
//  Tsugi
//
//  Created by Raman Verma on 05/10/26.
//

import SwiftUI

struct OnboardingPrivacyView: View {
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
                    "Tsugi does not contain, bundle, or endorse third-party ad services and tracking analytics. Your reading habits belong strictly to you."
                )
                Text(
                    "Every request, image stream, from bookmarked series to your page progress and chapter download is a direct handshake between your device and your hosted server."
                )
            }
            .font(.body)
            .fontWeight(.thin)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.secondary)

            Spacer()

            Text(
                "Tsugi has no control over network activity, external source extensions, or logs maintained on your server."
            )
            .font(.footnote)
            .fontWeight(.bold)
            .padding(.bottom, 24)
        }
    }
}
