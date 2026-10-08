//
//  AddServerSheetView.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

struct AddServerSheetView: View {
    @Environment(\.serverHealthService) private var serverHealthService
    @State private var viewModel: AddServerSheetViewModel

    init(_ storage: ServerStorage) {
        _viewModel = State(initialValue: AddServerSheetViewModel(storage))
    }

    var body: some View {
        Form {
            Section(
                header: Text(.buttonAddServer),
                footer: FormStatusSection()
            ) {
                Picker("Scheme", selection: $viewModel.scheme) {
                    ForEach(URLScheme.allCases) { scheme in
                        Text(scheme.displayName).tag(scheme)
                    }
                }

                TextField("Host (127.0.0.1)", text: $viewModel.host)
                    .keyboardType(.URL)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                TextField("Port (4567)", text: $viewModel.port)
                    .keyboardType(.numberPad)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                Button("Test Connection") {
                    Task {
                        await viewModel.testConnection(using: serverHealthService)
                    }
                }
                .foregroundStyle(.red)
            }
            .disabled(viewModel.status.isLoading)
        }
        .scrollDismissesKeyboard(.interactively)
        .presentationDetents([.medium, .large])
        .presentationBackgroundInteraction(.disabled)
        .presentationDragIndicator(.hidden)
        .safeAreaInset(edge: .top) {
            SheetToolbar()
        }
        .environment(viewModel)
    }
}

private struct SheetToolbar: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AddServerSheetViewModel.self) private var viewModel

    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: AppIcon.close)
                    .font(.title2)
                    .padding(8)
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
            .accessibilityLabel(
                .accessibilityCloseSheet(name: "Server")
            )

            Spacer()

            Button {
                if viewModel.saveConnection() {
                    dismiss()
                }
            } label: {
                if viewModel.status.isLoading {
                    ProgressView()
                        .tint(.white)
                        .padding(8)
                } else {
                    Image(systemName: AppIcon.checkmark)
                        .font(.title2)
                        .padding(8)
                }
            }
            .tint(.green)
            .buttonStyle(.glassProminent)
            .buttonBorderShape(.circle)
            .accessibilityLabel(.generalConfirm)
        }
        .padding([.horizontal, .top])
        .disabled(viewModel.status.isLoading)
    }
}

private struct FormStatusSection: View {
    @Environment(AddServerSheetViewModel.self) private var viewModel

    private func failureContent(_ message: String) -> some View {
        VStack(alignment: .leading) {
            Text("Error")
                .font(.body)
                .foregroundStyle(.red)

            HStack {
                Image(systemName: AppIcon.close)
                    .font(.body)
                    .hidden()

                Text(message.isEmpty ? "Something went wrong" : message)
                    .font(.callout)
            }
        }
    }

    private var successContent: some View {
        HStack(spacing: 12) {
            Image(systemName: AppIcon.checkmark)
                .font(.body)
                .foregroundStyle(.green)

            Text("Connected")
        }
    }

    var body: some View {
        switch viewModel.status {
        case .success:
            successContent
        case let .failure(message):
            failureContent(message)
        default:
            EmptyView()
        }
    }
}
