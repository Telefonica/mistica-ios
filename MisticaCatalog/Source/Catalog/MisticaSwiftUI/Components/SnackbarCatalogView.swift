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
    @State var autoDismissDelay = 3

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
            section("Auto Dismiss Delay") { Stepper("\(autoDismissDelay) seconds", value: $autoDismissDelay) }
            section("Button Style") { buttonStylePicker }
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
            autoDismissDelay: TimeInterval(autoDismissDelay),
            title: title,
            buttonTitle: buttonTitle,
            buttonAction: {}
        )
        .crouton(
            isVisible: $presentingCrouton,
            style: styles[selectedStyleIndex],
            buttonStyle: buttonStyles[selectedButtonStyleIndex],
            autoDismissDelay: TimeInterval(autoDismissDelay),
            title: title,
            buttonTitle: buttonTitle,
            buttonAction: {}
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
