//
//  LoadErrorView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public struct LoadErrorView: View {
    private enum Constants {
        static let contentInset: CGFloat = 24
        static let verticalSpacing: CGFloat = 16
    }

    @State var isRetryButtonLoading: Bool = false

    let titleText: String?
    let descriptionText: String
    let showActionButton: Bool
    let actionButtonTitle: String
    let onRetry: () -> Void
    let onAppear: (() -> Void)?

    public init(titleText: String?,
                descriptionText: String,
                showActionButton: Bool,
                actionButtonTitle: String,
                onRetry: @escaping () -> Void,
                onAppear: (() -> Void)?)
    {
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.showActionButton = showActionButton
        self.actionButtonTitle = actionButtonTitle
        self.onRetry = onRetry
        self.onAppear = onAppear
    }

    public var body: some View {
        VStack {
            VStack(alignment: .center, spacing: Constants.verticalSpacing) {
                if let titleText = titleText {
                    Text(titleText)
                        .font(.textPreset4(weight: .cardTitle))
                        .foregroundColor(.textPrimary)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                }

                Text(descriptionText)
                    .font(.textPreset3(weight: .regular))
                    .foregroundColor(.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)

                if showActionButton {
                    Button(action: {
                        isRetryButtonLoading = true
                        onRetry()
                    }) {
                        Text(actionButtonTitle)
                    }
                    .loading(isRetryButtonLoading)
                    .buttonStyle(.misticaSecondary(small: true))
                }
            }
            .padding(.horizontal, Constants.contentInset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview

struct LoadErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LoadErrorView(
            titleText: "Oops, something went wrong",
            descriptionText: "There was an error loading the content, please, check your network connection and try again later.",
            showActionButton: true,
            actionButtonTitle: "Retry",
            onRetry: {},
            onAppear: {}
        )
    }
}
