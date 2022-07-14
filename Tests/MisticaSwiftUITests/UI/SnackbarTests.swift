@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@available(iOS 13.0, *)
final class SnackbarTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testTitle() {
        let view = Rectangle()
            .foregroundColor(.white)
            .snackbar(
                isVisible: .constant(true),
                title: "Title"
            )

        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }

    func testLargeTitle() {
        let view = Rectangle()
            .foregroundColor(.white)
            .snackbar(
                isVisible: .constant(true),
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            )

        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }

    func testTitleAndAction() {
        let view = Rectangle()
            .foregroundColor(.white)
            .snackbar(
                isVisible: .constant(true),
                title: "Title",
                buttonTitle: "Action",
                buttonAction: {}
            )

        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }

    func testError() {
        let view = Rectangle()
            .foregroundColor(.white)
            .snackbar(
                isVisible: .constant(true),
                style: .error,
                title: "Title",
                buttonTitle: "Action",
                buttonAction: {}
            )

        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }

    func testLargeButton() {
        let view = Rectangle()
            .foregroundColor(.white)
            .snackbar(
                isVisible: .constant(true),
                buttonStyle: .large,
                title: "Title",
                buttonTitle: "Some large action title",
                buttonAction: {}
            )

        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }

    func testNotVisible() {
        let view = Rectangle()
            .foregroundColor(.white)
            .snackbar(
                isVisible: .constant(false),
                title: "Title",
                buttonTitle: "Action",
                buttonAction: {}
            )

        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }
}
