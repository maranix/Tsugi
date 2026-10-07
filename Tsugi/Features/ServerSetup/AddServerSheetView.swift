//
//  AddServerSheetView.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

struct AddServerSheetView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel: AddServerSheetViewModel

    init(_ serverStore: ServerStore) {
        self.viewModel = AddServerSheetViewModel(serverStore: serverStore)
    }

    var body: some View {
        Form {
            Section(
                header: Text(.buttonAddServer),
                footer: FormStatusSection(viewModel)
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
                        await viewModel.testConnection()
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
            SheetToolbar(dismiss: dismiss, viewModel: viewModel)
        }
    }
}

private struct SheetToolbar: View {
    private let dismiss: DismissAction
    private let viewModel: AddServerSheetViewModel

    init(dismiss: DismissAction, viewModel: AddServerSheetViewModel) {
        self.dismiss = dismiss
        self.viewModel = viewModel
    }

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
    }
}

private struct FormStatusSection: View {
    private let viewModel: AddServerSheetViewModel

    init(_ viewModel: AddServerSheetViewModel) {
        self.viewModel = viewModel
    }

    private var isSuccessOrFailure: Bool {
        switch viewModel.status {
        case .success:
            return true
        case .failure(_):
            return true
        default:
            return false
        }
    }

    @ViewBuilder
    private var failureContent: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: AppIcon.close)
                    .font(.body)

                Text("Error")
                    .font(.body)
            }
            .foregroundStyle(.red)

            HStack {
                Image(systemName: AppIcon.close)
                    .font(.body)
                    .hidden()

                if let message = viewModel.status.failureMessage,
                    !message.isEmpty
                {
                    Text(message)
                        .font(.callout)
                } else {
                    Text("Something went wrong")
                        .font(.callout)
                }
            }
        }
    }

    @ViewBuilder
    private var successContent: some View {
        HStack(spacing: 12) {
            Image(systemName: AppIcon.checkmark)
                .font(.body)
                .tint(.green)

            Text("Connected")
        }
    }

    var body: some View {
        if isSuccessOrFailure {
            if viewModel.status.isSuccess {
                successContent
            } else {
                failureContent
            }
        }
    }
}
