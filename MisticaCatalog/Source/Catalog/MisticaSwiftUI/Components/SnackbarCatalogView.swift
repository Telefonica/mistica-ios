//
//  SnackbarCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

enum SnackbarCatalogDismissInterval: CaseIterable {
    case fiveSeconds
    case tenSeconds
    case infinity
}

struct SnackbarCatalogView: View {
    @State var title: String = "Message"
    @State var buttonTitle: String = "Action"
    @State var selectedStyleIndex = 0
    @State var selectedButtonStyleIndex = 0
    @State var presentingSnackbar = false
    @State var presentingCrouton = false
    @State var selectedIntervalStyleIndex = 0
    @State var hasForceDismissAction: Bool = false
    private let styles: [SnackbarStyle] = [.normal, .error]
    private let buttonStyles: [SnackbarButtonStyle] = [.short, .large]
    private let intervalStyles: [SnackbarCatalogDismissInterval] = SnackbarCatalogDismissInterval.allCases

    var body: some View {
        List {
            section("Title") {
                TextField(
                    "Title",
                    text: $title
                )
                .endEditingOnTap()
            }
            if intervalStyles[selectedIntervalStyleIndex] != .fiveSeconds {
                section("Button") {
                    TextField(
                        "Button Title",
                        text: $buttonTitle
                    )
                    .endEditingOnTap()
                }
            }
            section("Style") { stylePicker }
            section("Auto Dismiss Delay") { intervalPicker }
            section("Button Style") { buttonStylePicker }
            if intervalStyles[selectedIntervalStyleIndex] == .infinity && !buttonTitle.isEmpty {
                section("Force Dismiss") { Toggle("Has force dismiss action", isOn: $hasForceDismissAction) }
            }
            section("Snackbar") {
                Button("Show snackbar") {
                    withAnimation {
                        presentingSnackbar.toggle()
                    }
                }
                .buttonStyle(.misticaPrimary())
            }
            section("Crouton") {
                Button("Show crouton") {
                    withAnimation {
                        presentingCrouton.toggle()
                    }
                }
                .buttonStyle(.misticaPrimary())
            }
        }
        .snackbar(
            isVisible: $presentingSnackbar,
            style: styles[selectedStyleIndex],
            buttonStyle: buttonStyles[selectedButtonStyleIndex],
            config: SnackbarConfig(
                title: title,
                dismissInterval: dismissInterval
            ),
            dismissHandlerBlock: { reason in
                print(reason.rawValue)
            }
        )
        .crouton(
            isVisible: $presentingCrouton,
            style: styles[selectedStyleIndex],
            buttonStyle: buttonStyles[selectedButtonStyleIndex],
            config: SnackbarConfig(
                title: title,
                dismissInterval: dismissInterval
            ),
            dismissHandlerBlock: { reason in
                print(reason.rawValue)
            }
        )
    }

    var dismissInterval: SnackbarDismissInterval {
        switch intervalStyles[selectedIntervalStyleIndex] {
        case .fiveSeconds:
            return .fiveSeconds
        case .tenSeconds:
            return .tenSeconds(SnackbarAction(title: buttonTitle.isEmpty ? "Action" : buttonTitle, handler: {}))
        case .infinity:
            if !buttonTitle.isEmpty {
                if hasForceDismissAction {
                    return .infinityWithClose(SnackbarAction(title: buttonTitle, handler: {}))
                } else {
                    return .infinity(SnackbarAction(title: buttonTitle, handler: {}))
                }
            } else {
                return .infinityWithClose(nil)
            }
        }
    }

    @ViewBuilder
    var stylePicker: some View {
        picker($selectedStyleIndex, options: styles)
    }

    @ViewBuilder
    var buttonStylePicker: some View {
        picker($selectedButtonStyleIndex, options: buttonStyles)
    }

    @ViewBuilder
    var intervalPicker: some View {
        picker($selectedIntervalStyleIndex, options: intervalStyles)
    }
}

extension SnackbarCatalogView {
    func timeIntervalDescription(from interval: SnackbarDismissInterval) -> String {
        switch interval {
        case .fiveSeconds:
            return "5"
        case .tenSeconds:
            return "10"
        case .infinity:
            return "∞"
        case .infinityWithClose:
            return "∞ close"
        }
    }
}

// MARK: CustomStringConvertible

extension SnackbarStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .normal:
            return "Normal"
        case .error:
            return "Error"
        }
    }
}

extension SnackbarButtonStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .large:
            return "Large"
        case .short:
            return "Short"
        }
    }
}

extension SnackbarCatalogDismissInterval: CustomStringConvertible {
    public var description: String {
        switch self {
        case .fiveSeconds:
            return "Five Seconds"
        case .tenSeconds:
            return "Ten Seconds"
        case .infinity:
            return "Infinite"
        }
    }
}

// MARK: Previews

#if DEBUG
    struct SnackbarCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                SnackbarCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
