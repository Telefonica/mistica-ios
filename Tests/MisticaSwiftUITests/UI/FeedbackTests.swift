//
//  FeedbackTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@MainActor
final class FeedbackTests: XCTestCase {
    private enum Constants {
        static let singleLineTitle = "Title"
        static let singleLineMessage = "Message"
        static let multiLineTitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        static let multiLineSubtitle = "Nam non ipsum id metus cursus dictum. Praesent efficitur erat libero, vitae tempus orci iaculis id. Proin ipsum ante, auctor mattis rutrum sit amet, elementum vitae quam. Praesent velit lectus, lacinia ut accumsan sit amet, convallis non leo. Ut quis facilisis sapien. "
    }
    
    override func invokeTest() {
        withSnapshotTesting(record: .failed) {
            super.invokeTest()
        }
    }

    func testInformative() {
        let feedback = makeTemplate(style: .informative)

        assertSnapshotWithoutAnimations(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testError() {
        let feedback = makeTemplate(style: .error(reference: nil))

        assertSnapshotWithoutAnimations(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testErrorReference() {
        let feedback = makeTemplate(style: .error(reference: "Error reference: #1992"))

        assertSnapshotWithoutAnimations(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testSuccess() {
        let feedback = makeTemplate(style: .success)

        assertSnapshotWithoutAnimations(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testFeedback() {
        let feedback = makeTemplate(style: .feedback(Image(systemName: "swift")))

        assertSnapshotWithoutAnimations(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testMultiline() {
        let feedback = makeTemplate(style: .informative, title: Constants.multiLineTitle, message: Constants.multiLineSubtitle)

        assertSnapshot(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testLinkButton() {
        let feedback = Feedback(
            style: .informative,
            title: Constants.singleLineTitle,
            message: Constants.singleLineMessage,
            primaryButton: {
                Button("Primary", action: {})
            },
            linkButton: {
                Button("Link", action: {})
            }
        )

        assertSnapshot(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testSecondaryButton() {
        let feedback = Feedback(
            style: .informative,
            title: Constants.singleLineTitle,
            message: Constants.singleLineMessage,
            primaryButton: {
                Button("Primary", action: {})
            },
            secondaryButton: {
                Button("Secondary", action: {})
            }
        )

        assertSnapshot(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testPrimarySecondaryAndLinkButtons() {
        let feedback = Feedback(
            style: .informative,
            title: Constants.singleLineTitle,
            message: Constants.singleLineMessage,
            primaryButton: {
                Button("Primary", action: {})
            },
            secondaryButton: {
                Button("Secondary", action: {})
            },
            linkButton: {
                Button("Link", action: {})
            }
        )

        assertSnapshot(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testSecondaryAndLinkButtons() {
        let feedback = Feedback(
            style: .informative,
            title: Constants.singleLineTitle,
            message: Constants.singleLineMessage,
            secondaryButton: {
                Button("Secondary", action: {})
            },
            linkButton: {
                Button("Link", action: {})
            }
        )

        assertSnapshot(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testContent() {
        let feedback = Feedback(
            style: .informative,
            title: Constants.singleLineTitle,
            message: Constants.singleLineMessage
        ) {
            contentView
        } primaryButton: {
            Button("Primary", action: {})
        } secondaryButton: {
            Button("Link", action: {})
        }

        assertSnapshotWithoutAnimations(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }

    func testContentAndReference() {
        let feedback = Feedback(
            style: .informative,
            title: Constants.singleLineTitle,
            message: Constants.singleLineMessage
        ) {
            contentView
        } primaryButton: {
            Button("Primary", action: {})
        } secondaryButton: {
            Button("Link", action: {})
        }

        assertSnapshotWithoutAnimations(
            of: UIHostingController(rootView: feedback),
            as: .image(on: .iPhone8)
        )
    }
}

private extension FeedbackTests {
    func makeTemplate(
        style: FeedbackStyle,
        title: String = Constants.singleLineTitle,
        message: String = Constants.singleLineMessage
    ) -> some View {
        Feedback(
            style: style,
            title: title,
            message: message,
            primaryButton: {
                Button("Primary", action: {})
            }
        )
    }

    @ViewBuilder
    var contentView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("👇 This extra view is optional")
                .font(.textPreset3(weight: .regular))
                .foregroundColor(.textPrimary)
            Text("✅ Any UIView is allowed here")
                .font(.textPreset3(weight: .regular))
                .foregroundColor(.textPrimary)
            Text("⚠️ It will always be placed below the subtitle")
                .font(.textPreset3(weight: .regular))
                .foregroundColor(.textPrimary)
            Text("🌀 It will be animated along the other text")
                .font(.textPreset3(weight: .regular))
                .foregroundColor(.textPrimary)
            Spacer()
        }
    }
}
