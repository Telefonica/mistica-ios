//
//  SnackbarCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

struct SnackbarCatalogView: View {
    @State var title: String = "Message"
    @State var buttonTitle: String = "Action"
    @State var selectedStyleIndex = 0
    @State var styles: [SnackbarStyle] = [.normal, .error]
    @State var selectedButtonStyleIndex = 0
    @State var buttonStyles: [SnackbarButtonStyle] = [.short, .large]
    @State var presentingSnackbar = false
    @State var presentingCrouton = false
    @State var autoDismissDelay: CroutonDismissInterval = .fiveSeconds
    @State var intervalStyles: [CroutonDismissInterval] = [.fiveSeconds, .tenSeconds, .infinite]
    @State var selectedIntervalStyleIndex = 0
    @State var hasForceDismissAction: Bool = false

    var body: some View {
        List {
            section("Title") {
                TextField(
                    "Title",
                    text: $title
                )
                .endEditingOnTap()
            }
            section("Button") {
                TextField(
                    "Button Title",
                    text: $buttonTitle
                )
                .endEditingOnTap()
            }
            section("Style") { stylePicker }
            section("Auto Dismiss Delay") { intervalPicker }
            section("Button Style") { buttonStylePicker }
            section("Force Dismiss") { Toggle("Has force dismiss action", isOn: $hasForceDismissAction) }
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
            autoDismissDelay: intervalStyles[selectedIntervalStyleIndex],
            title: title,
            buttonTitle: buttonTitle,
            buttonAction: buttonTitle.isEmpty ? nil : {},
            forceDismiss: hasForceDismissAction,
            dismissHandlerBlock: { reason in
                print(reason)
            }
            
        )
        .crouton(
            isVisible: $presentingCrouton,
            style: styles[selectedStyleIndex],
            buttonStyle: buttonStyles[selectedButtonStyleIndex],
            autoDismissDelay: intervalStyles[selectedIntervalStyleIndex],
            title: title,
            buttonTitle: buttonTitle,
            buttonAction: {},
            forceDismiss: hasForceDismissAction,
            dismissHandlerBlock: { reason in
                print(reason)
            }
        )
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
    func timeIntervalDescription(from interval: CroutonDismissInterval) -> String {
        switch interval {
        case .fiveSeconds:
            return "5"
        case .tenSeconds:
            return "10"
        case .infinite:
            return "∞"
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

extension CroutonDismissInterval: CustomStringConvertible {
    public var description: String {
        switch self {
        case .fiveSeconds:
            return "Five Seconds"
        case .tenSeconds:
            return " Ten Seconds"
        case .infinite:
            return "Inifinite"
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
