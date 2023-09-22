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
    @State var slot: Bool = false

    @State var selectedStyleIndex = 0
    @State var styles: [FeedbackStyle] = [
        .informative,
        .success,
        .error(reference: "Error reference: #1993"),
        .feedback(Image("feedbackIcon"))
    ]

    @State var presentingFeedback = false

    var body: some View {
        List {
            section("Title") { TextField("Title", text: $title) }
            section("Message") { TextField("Message", text: $message) }
            section("Slot") { Toggle("Show slot", isOn: $slot) }

            section("Style") { stylePicker }

            section("Result") {
                Button("Present") {
                    presentingFeedback.toggle()
                }
                .buttonStyle(.misticaPrimary())
            }
        }
        .sheet(isPresented: $presentingFeedback) {
            if slot {
                FeedBackSlot
            } else {
                FeedBack
            }
        }
    }

    @ViewBuilder
    var FeedBack: some View {
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

    @ViewBuilder
    var FeedBackSlot: some View {
        Feedback(
            style: styles[selectedStyleIndex],
            title: title,
            message: message,
            contentView: { text },
            primaryButton: { Button("Primary", action: {}) },
            secondaryButton: { Button("Secondary", action: {}) }
        )
        .titleAccessibilityLabel("Title")
        .imageAccessibilityIdentifier("Image")
    }

    @ViewBuilder
    var text: some View {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vitae suscipit purus. Nullam quis venenatis lorem. Curabitur laoreet sem sed eros rutrum dictum. Vivamus fermentum vestibulum lacus non euismod. Vestibulum imperdiet sem et neque convallis tempus. Curabitur at lectus enim. Donec vehicula, tortor in pulvinar ornare, nisl justo accumsan ipsum, et sodales magna arcu vel odio. Sed tincidunt ante ligula, sed venenatis eros rutrum ac. Aenean fringilla elit mollis venenatis tempor. Aliquam facilisis, erat quis congue faucibus, enim erat pulvinar justo, ac mollis erat nulla ut dolor. Etiam rhoncus nulla mi, non pretium eros lobortis nec. Ut vulputate ex eu nibh laoreet, in luctus tortor elementum. Ut tristique lectus vel arcu suscipit, sit amet consequat enim porta. Suspendisse vulputate placerat lorem a luctus. Sed suscipit lacus vehicula sapien malesuada semper. Mauris urna orci, maximus non eleifend blandit, accumsan id mi.\nInteger a hendrerit sapien, nec gravida diam. Donec semper vehicula eros ut pharetra. In non convallis tellus, sed ultrices nulla. Cras a arcu neque. Quisque sit amet arcu congue, molestie risus non, facilisis felis. Vivamus et accumsan ipsum, et condimentum quam. Suspendisse eleifend velit turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla rutrum mauris vel felis porttitor, ut luctus turpis mollis. Suspendisse a nulla ultricies, malesuada augue quis, varius mauris. Morbi eget lacinia orci. Phasellus vel varius nisi.")
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
        case .feedback:
            return "Feedback"
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
