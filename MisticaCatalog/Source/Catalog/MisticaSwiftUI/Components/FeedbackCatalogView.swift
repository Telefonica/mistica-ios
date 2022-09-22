//
//  FeedbackCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

struct FeedbackCatalogView: View {
    @State var title: String = "Title of the feedback"
    @State var message: String = "Insert here the message that will be included in the feedback."

    @State var selectedStyleIndex = 0
    @State var styles: [FeedbackStyle] = [.informative, .success, .error(reference: "Error reference: #1993")]

    @State var presentingFeedback = false

    var body: some View {
        List {
            section("Title") { TextField("Title", text: $title) }
            section("Message") { TextField("Message", text: $message) }

            section("Style") { stylePicker }

            section("Result") {
                Button("Present") {
                    presentingFeedback.toggle()
                }
                .buttonStyle(.misticaPrimary())
            }
        }
        .sheet(isPresented: $presentingFeedback) {
            Feedback(
                style: styles[selectedStyleIndex],
                title: title,
                message: message,
                primaryButton: { Button("Primary", action: {}) },
                secondaryButton: { Button("Secondary", action: {}) }
            )
            .titleAccessibilityLabel("Title")
            .imageAccessibilityIdentifier("Image")
        }
    }

    @ViewBuilder
    var stylePicker: some View {
        picker($selectedStyleIndex, options: styles)
    }
}

extension FeedbackStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .success:
            return "Success"
        case .error:
            return "Error"
        case .informative:
            return "Informative"
        }
    }
}

#if DEBUG
    struct FeedbackCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                FeedbackCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
