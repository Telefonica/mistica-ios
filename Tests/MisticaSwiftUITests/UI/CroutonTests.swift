//
//  CroutonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

final class CroutonTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testTitle() {
        let view = Rectangle()
            .foregroundColor(.white)
            .crouton(
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
            .crouton(
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
            .crouton(
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
            .crouton(
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
            .crouton(
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
            .crouton(
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

    func testForceDismissWithTenSecondsTimeInterval() {
        let view = Rectangle()
            .foregroundColor(.white)
            .crouton(
                isVisible: .constant(true),
                title: "Title",
                buttonTitle: "Action",
                buttonAction: {},
                forceDismiss: true
            )
        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }

    func testForceDismissWithInfiniteTimeInterval() {
        let view = Rectangle()
            .foregroundColor(.white)
            .crouton(
                isVisible: .constant(true),
                autoDismissDelay: .infinite,
                title: "Title",
                buttonTitle: "Action",
                buttonAction: {},
                forceDismiss: true
            )
        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }

    func testLargeButtonAndForceDismissWithInfiniteTimeInterval() {
        let view = Rectangle()
            .foregroundColor(.white)
            .crouton(
                isVisible: .constant(true),
                buttonStyle: .large,
                autoDismissDelay: .infinite,
                title: "Title",
                buttonTitle: "Large Action",
                buttonAction: {},
                forceDismiss: true
            )
        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }
}
