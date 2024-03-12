//
//  Callout.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public enum CalloutAssetType {
    case none
    case image(image: Image)
}

public struct Callout<LeadingButton: View, TrailingButton: View>: View {
    private let assetType: CalloutAssetType
    private let title: String?
    private let description: String
    private let dismissAction: (() -> Void)?
    private let leadingButton: LeadingButton
    private let leadingButtonStyle: MisticaButtonStyle
    private let trailingButton: TrailingButton
    private let trailingButtonStyle: MisticaButtonStyle

    private var assetAccessibilityLabel: String?
    private var assetAccessibilityIdentifier: String?
    private var dismissButtonAccessibilityLabel: String?
    private var dismissButtonAccessibilityIdentifier: String?
    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?
    private var descriptionAccessibilityLabel: String?
    private var descriptionAccessibilityIdentifier: String?
    private var inverse: Bool

    fileprivate init(
        assetType: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        dismissAction: (() -> Void)? = nil,
        leadingButton: LeadingButton,
        leadingButtonStyle: MisticaButtonStyle,
        trailingButton: TrailingButton,
        trailingButtonStyle: MisticaButtonStyle,
        inverse: Bool = false
    ) {
        self.assetType = assetType
        self.title = title
        self.description = description
        self.dismissAction = dismissAction
        self.leadingButton = leadingButton
        self.leadingButtonStyle = leadingButtonStyle
        self.trailingButton = trailingButton
        self.trailingButtonStyle = trailingButtonStyle
        self.inverse = inverse
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 16) {
            assetView
                .accessibilityLabel(assetAccessibilityLabel)
                .accessibilityIdentifier(assetAccessibilityIdentifier)

            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        title
                            .map(Text.init)?
                            .font(.textPreset3(weight: .regular))
                            .foregroundColor(.textPrimary)
                            .accessibilityLabel(titleAccessibilityLabel)
                            .accessibilityIdentifier(titleAccessibilityIdentifier)
                        
                        Text(description)
                            .font(.textPreset2(weight: .regular))
                            .padding(.top, descriptionTopPadding)
                            .foregroundColor(.textSecondary)
                            .accessibilityLabel(descriptionAccessibilityLabel)
                            .accessibilityIdentifier(descriptionAccessibilityIdentifier)
                    }
                    Spacer()
                    if let dismissAction = dismissAction {
                        Button {
                            dismissAction()
                        } label: {
                            dismissView
                                .foregroundColor(Color.neutralHigh)
                        }
                        .accessibilityLabel(dismissButtonAccessibilityLabel)
                        .accessibilityIdentifier(dismissButtonAccessibilityIdentifier)
                    }
                }

                if hasButton {
                    Spacer().frame(height: 16)
                }

                HStack(spacing: 24) {
                    leadingButton
                        .buttonStyle(leadingButtonStyle)

                    trailingButton
                        .buttonStyle(trailingButtonStyle)
                }
            }
        }
        .padding(16)
        .background(backgroundColor)
        .round(radiusStyle: .container)
    }

    private var backgroundColor: Color {
        inverse ? .backgroundContainer : .backgroundAlternative
    }

    private var hasButton: Bool {
        LeadingButton.self != EmptyView.self || TrailingButton.self != EmptyView.self
    }

    private var descriptionTopPadding: CGFloat {
        title != nil ? 4 : 0
    }

    @ViewBuilder
    var assetView: some View {
        switch assetType {
        case .none:
            EmptyView()
        case .image(let image):
            image.frame(width: 22, height: 22, alignment: .center)
        }
    }

    @ViewBuilder
    var dismissView: some View {
        Image.closeButtonBlackSmallIcon.frame(width: 22, height: 22, alignment: .center)
    }
}

// MARK: Initialisation

public extension Callout {
    init(
        assetType: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder primaryButton: () -> LeadingButton
    ) where TrailingButton == EmptyView {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            dismissAction: dismissAction,
            leadingButton: primaryButton(),
            leadingButtonStyle: .misticaPrimary(small: true),
            trailingButton: EmptyView(),
            trailingButtonStyle: .misticaPrimary()
        )
    }

    init(
        assetType: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder primaryButton: () -> LeadingButton,
        @ViewBuilder linkButton: () -> TrailingButton
    ) {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            dismissAction: dismissAction,
            leadingButton: primaryButton(),
            leadingButtonStyle: .misticaPrimary(small: true),
            trailingButton: linkButton(),
            trailingButtonStyle: .misticaLink(small: true)
        )
    }

    init(
        assetType: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder primaryButton: () -> LeadingButton,
        @ViewBuilder secondaryButton: () -> TrailingButton
    ) {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            dismissAction: dismissAction,
            leadingButton: primaryButton(),
            leadingButtonStyle: .misticaPrimary(small: true),
            trailingButton: secondaryButton(),
            trailingButtonStyle: .misticaSecondary(small: true)
        )
    }

    init(
        assetType: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder secondaryButton: () -> LeadingButton
    ) where TrailingButton == EmptyView {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            dismissAction: dismissAction,
            leadingButton: secondaryButton(),
            leadingButtonStyle: .misticaSecondary(small: true),
            trailingButton: EmptyView(),
            trailingButtonStyle: .misticaPrimary()
        )
    }

    init(
        assetType: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder secondaryButton: () -> LeadingButton,
        @ViewBuilder linkButton: () -> TrailingButton
    ) {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            dismissAction: dismissAction,
            leadingButton: secondaryButton(),
            leadingButtonStyle: .misticaSecondary(small: true),
            trailingButton: linkButton(),
            trailingButtonStyle: .misticaLink(small: true)
        )
    }

    init(
        assetType: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder linkButton: () -> LeadingButton
    ) where TrailingButton == EmptyView {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            dismissAction: dismissAction,
            leadingButton: linkButton(),
            leadingButtonStyle: .misticaLink(small: true, bleedingAlignment: .leading),
            trailingButton: EmptyView(),
            trailingButtonStyle: .misticaPrimary()
        )
    }

    init(
        assetType: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        dismissAction: (() -> Void)? = nil
    ) where TrailingButton == EmptyView, LeadingButton == EmptyView {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            dismissAction: dismissAction,
            leadingButton: EmptyView(),
            leadingButtonStyle: .misticaPrimary(),
            trailingButton: EmptyView(),
            trailingButtonStyle: .misticaPrimary()
        )
    }
}

// MARK: Modifiers

public extension Callout {
    func assetAccessibilityLabel(_ assetAccessibilityLaber: String?) -> Callout {
        var callout = self
        callout.assetAccessibilityLabel = assetAccessibilityLabel
        return callout
    }

    func assetAccessibilityIdentifier(_ assetAccessibilityIdentifier: String?) -> Callout {
        var callout = self
        callout.assetAccessibilityIdentifier = assetAccessibilityIdentifier
        return callout
    }

    func dismissButtonAccessibilityLabel(_ dismissButtonAccessibilityLaber: String?) -> Callout {
        var callout = self
        callout.dismissButtonAccessibilityLabel = dismissButtonAccessibilityLabel
        return callout
    }

    func dismissButtonAccessibilityIdentifier(_ dismissButtonAccessibilityIdentifier: String?) -> Callout {
        var callout = self
        callout.dismissButtonAccessibilityIdentifier = dismissButtonAccessibilityIdentifier
        return callout
    }

    func titleAccessibilityLabel(_ titleAccessibilityLaber: String?) -> Callout {
        var callout = self
        callout.titleAccessibilityLabel = titleAccessibilityLabel
        return callout
    }

    func titleAccessibilityIdentifier(_ titleAccessibilityIdentifier: String?) -> Callout {
        var callout = self
        callout.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        return callout
    }

    func descriptionAccessibilityLabel(_ descriptionAccessibilityLaber: String?) -> Callout {
        var callout = self
        callout.descriptionAccessibilityLabel = descriptionAccessibilityLabel
        return callout
    }

    func descriptionAccessibilityIdentifier(_ descriptionAccessibilityIdentifier: String?) -> Callout {
        var callout = self
        callout.descriptionAccessibilityIdentifier = descriptionAccessibilityIdentifier
        return callout
    }

    func inverseBackground(_ inverse: Bool) -> Callout {
        var callout = self
        callout.inverse = inverse
        return callout
    }
}

// MARK: Previews

#if DEBUG

    struct Callout_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                Callout(
                    title: "Hola",
                    description: "Description",
                    linkButton: { Button("Link") {} }
                )

                Callout(
                    assetType: .image(image: Image(systemName: "plus.app")),
                    title: "Hola",
                    description: "Description",
                    dismissAction: {},
                    secondaryButton: { Button("Primary button") {} },
                    linkButton: { Button("Link button") {} }
                )

                Callout(
                    assetType: .image(image: .closeButtonBlackSmallIcon),
                    title: "Hola",
                    description: "Description",
                    primaryButton: { Button("Primary") {} }
                )

                Callout(
                    assetType: .none,
                    title: "Hola",
                    description: "Description",
                    primaryButton: { Button("Primary") {} },
                    linkButton: { Button("Link") {} }
                )

                Callout(description: "Description")
            }.padding()
        }
    }
#endif
