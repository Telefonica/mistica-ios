@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@available(iOS 13.0, *)
final class EmptyStateTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testIconAsset() {
        let emptyState = EmptyState(
            assetType: .icon(Image(color: .red), foregroundColor: .black, backgroundColor: .clear),
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary") {} },
            secondaryButton: { Button("Secondary") {} }
        )

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }

    func testFullWidthAsset() {
        let emptyState = EmptyState(
            assetType: .fullWidth(Image(color: .red)),
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary") {} },
            secondaryButton: { Button("Secondary") {} }
        )
        .frame(width: 300, height: 300)

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }

    func testImageAsset() {
        let emptyState = EmptyState(
            assetType: .image(Image(color: .red)),
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary") {} },
            secondaryButton: { Button("Secondary") {} }
        )

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }

    func testLargeText() {
        let emptyState = EmptyState(
            assetType: .icon(Image(color: .red), foregroundColor: .black, backgroundColor: .clear),
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            primaryButton: { Button("Primary") {} },
            secondaryButton: { Button("Secondary") {} }
        )
        .frame(height: 300)

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }

    func testJustPrimaryButton() {
        let emptyState = EmptyState(
            assetType: .icon(Image(color: .red), foregroundColor: .black, backgroundColor: .clear),
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary") {} }
        )

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }

    func testJustSecondaryButton() {
        let emptyState = EmptyState(
            assetType: .icon(Image(color: .red), foregroundColor: .black, backgroundColor: .clear),
            title: "Title",
            description: "Description",
            secondaryButton: { Button("Secondary") {} }
        )

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }

    func testNoButtons() {
        let emptyState = EmptyState(
            assetType: .icon(Image(color: .red), foregroundColor: .black, backgroundColor: .clear),
            title: "Title",
            description: "Description"
        )
        .frame(width: 150)

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }

    func testNoDescription() {
        let emptyState = EmptyState(
            assetType: .icon(Image(color: .red), foregroundColor: .black, backgroundColor: .clear),
            title: "Title",
            primaryButton: { Button("Primary") {} },
            secondaryButton: { Button("Secondary") {} }
        )

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }

    func testCardStyle() {
        let emptyState = EmptyState(
            assetType: .icon(Image(color: .red), foregroundColor: .black, backgroundColor: .clear),
            title: "Title",
            description: "Description",
            primaryButton: { Button("Primary") {} },
            secondaryButton: { Button("Secondary") {} }
        )
        .cardStyle()
        .padding(24)

        assertSnapshot(
            matching: emptyState,
            as: .image
        )
    }
}
