import Mistica
import SnapshotTesting
import SwiftUI
import XCTest

final class CalloutTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    func testPrimary() {
        let callout = Callout(
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testPrimaryAndSecondary() {
        let callout = Callout(
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary", action: {}) },
            secondaryButton: { Button("Secondary", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testPrimaryAndLink() {
        let callout = Callout(
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary", action: {}) },
            linkButton: { Button("Link", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testSecondary() {
        let callout = Callout(
            title: "Title",
            description: "Description",
            secondaryButton: { Button("Secondary", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testSecondaryAndLink() {
        let callout = Callout(
            title: "Title",
            description: "Description",
            secondaryButton: { Button("Secondary", action: {}) },
            linkButton: { Button("Secondary", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testLink() {
        let callout = Callout(
            title: "Title",
            description: "Description",
            linkButton: { Button("Secondary", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testNoButtons() {
        let callout = Callout(
            title: "Title",
            description: "Description"
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testNoTitle() {
        let callout = Callout(
            description: "Description"
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testDismissButton() {
        let callout = Callout(
            assetType: .none,
            title: "Title",
            description: "Description",
            dismissAction: {},
            primaryButton: { Button("Primary", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testImage() {
        let callout = Callout(
            assetType: .image(image: Image(systemName: "photo")),
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }

    func testImageAndDismiss() {
        let callout = Callout(
            assetType: .image(image: Image(systemName: "photo")),
            title: "Title",
            description: "Description",
            dismissAction: {},
            primaryButton: { Button("Primary", action: {}) }
        )
        .frame(width: 350)

        assertSnapshot(
            matching: callout,
            as: .image
        )
    }
}
