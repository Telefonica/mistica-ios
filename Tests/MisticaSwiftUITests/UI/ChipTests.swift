//
//  ChipTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

final class ChipTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testTooShortChip() {
        let chip = Chip(style: .normal, text: "", isSelected: .constant(false))

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testTooLongChip() {
        let chip = Chip(style: .normal, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", icon: .search, onDismiss: {})

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testChipWithImageAndClose() {
        let chip = Chip(style: .normal, text: "Lorem ipsum", icon: .search, onDismiss: {})

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testChipWithClose() {
        let chip = Chip(style: .normal, text: "Lorem ipsum", onDismiss: {})

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testChipWithImage() {
        let chip = Chip(style: .normal, text: "Lorem ipsum", icon: .search, isSelected: .constant(false))

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testSelectedChipWithImage() {
        let chip = Chip(style: .normal, text: "Lorem ipsum", icon: .search, isSelected: .constant(true))

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testTooShortInverseChip() {
        let chip = Chip(style: .inverse, text: "", isSelected: .constant(false))

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testTooLongInverseChip() {
        let chip = Chip(style: .inverse, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", icon: .search, isSelected: .constant(false))

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testInverseChipWithImageAndClose() {
        let chip = Chip(style: .inverse, text: "Lorem ipsum", icon: .search, onDismiss: {})

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testInverseChipWithClose() {
        let chip = Chip(style: .inverse, text: "Lorem ipsum", icon: nil, onDismiss: {})

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testInverseChipWithImage() {
        let chip = Chip(style: .inverse, text: "Lorem ipsum", icon: .search, isSelected: .constant(false))

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    func testSelectedInverseChipWithImage() {
        let chip = Chip(style: .inverse, text: "Lorem ipsum", icon: .search, isSelected: .constant(true))

        assertSnapshot(
            matching: fixedContainer { chip },
            as: .image
        )
    }

    @ViewBuilder
    private func fixedContainer(@ViewBuilder chip: () -> Chip) -> some View {
        HStack { chip() }.frame(width: 200, height: 100)
    }
}
