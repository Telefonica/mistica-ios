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
                config: SnackbarConfig(title: "Title", dismissInterval: .fiveSeconds)
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
                config: SnackbarConfig(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", dismissInterval: .fiveSeconds)
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
                config: SnackbarConfig(title: "Title", dismissInterval: .tenSeconds(SnackbarAction(title: "Action", handler: {})))
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
                config: SnackbarConfig(title: "Title", dismissInterval: .tenSeconds(SnackbarAction(title: "Action", handler: {})))
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
                config: SnackbarConfig(title: "Title", dismissInterval: .tenSeconds(SnackbarAction(title: "Some large action title", handler: {})))
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
                config: SnackbarConfig(title: "Title", dismissInterval: .tenSeconds(SnackbarAction(title: "Action", handler: {})))
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
                config: SnackbarConfig(title: "Title", dismissInterval: .tenSeconds(SnackbarAction(title: "Action", handler: {})))
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
                config: SnackbarConfig(title: "Title", dismissInterval: .infinite(SnackbarAction(title: "Action", handler: {})), forceDismiss: true)
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
                config: SnackbarConfig(title: "Title", dismissInterval: .infinite(SnackbarAction(title: "Large Action", handler: {})), forceDismiss: true)
            )
        assertSnapshot(
            matching: UIHostingController(rootView: view),
            as: .image(on: .iPhone8)
        )
    }
}
