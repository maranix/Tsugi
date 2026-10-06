//
//  AddServerSheetView.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

struct AddServerSheetView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: AppIcon.close)
                    .font(.title2)
                    .padding(.all, 12)
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
            .accessibilityLabel(.accessibilityPreviousPage)

            Text("Add Server")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()

            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Test")
                        .frame(maxWidth: .infinity)
                }
                .tint(.mint)
                .buttonStyle(.glassProminent)
                .controlSize(.extraLarge)
                
                Button {
                    dismiss()
                } label: {
                    Text("Confirm")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.glass)
                .controlSize(.extraLarge)
            }
        }
        .padding()
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}
