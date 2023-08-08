//
//  ButtonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

final class ButtonTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    // MARK: Regular Buttons

    func testRegularSizeWithPrimaryStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaPrimary(small: false)),
            as: .image
        )
    }

    func testRegularSizeWithPrimaryInverseStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaPrimaryInverse(small: false), inverse: true),
            as: .image
        )
    }

    func testRegularSizeWithSecondaryStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaSecondary(small: false)),
            as: .image
        )
    }

    func testRegularSizeWithSecondaryInverseStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaSecondaryInverse(small: false), inverse: true),
            as: .image
        )
    }

    func testRegularSizeWithDangerStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaDanger(small: false)),
            as: .image
        )
    }

    func testRegularSizeWithLinkStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaLink(small: false)),
            as: .image
        )
    }

    func testRegularSizeWithLinkInverseStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaLinkInverse(small: false), inverse: true),
            as: .image
        )
    }

    func testRegularSizeWithLinkWithChevron() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaLink(withChevron: true)),
            as: .image
        )
    }

    func testRegularSizeWithLinkInverseWithChevron() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaLinkInverse(withChevron: true), inverse: true),
            as: .image
        )
    }

    // MARK: Small Buttons

    func testSmallSizeWithPrimaryStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaPrimary(small: true)),
            as: .image
        )
    }

    func testSmallSizeWithPrimaryInverseStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaPrimaryInverse(small: true), inverse: true),
            as: .image
        )
    }

    func testSmallSizeWithSecondaryStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaSecondary(small: true)),
            as: .image
        )
    }

    func testSmallSizeWithSecondaryInverseStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaSecondaryInverse(small: true), inverse: true),
            as: .image
        )
    }

    func testSmallSizeWithDangerStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaDanger(small: true)),
            as: .image
        )
    }

    func testSmallSizeWithLinkStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaLink(small: true)),
            as: .image
        )
    }

    func testSmallSizeWithLinkInverseStyle() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaLinkInverse(small: true), inverse: true),
            as: .image
        )
    }

    func testSmallSizeWithLinkWithChevron() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaLink(small: true, withChevron: true)),
            as: .image
        )
    }

    func testSmallSizeWithLinkInverseWithChevron() {
        assertSnapshot(
            matching: makeTemplateWithAllButtonStates(style: .misticaLinkInverse(small: true, withChevron: true), inverse: true),
            as: .image
        )
    }
}

// MARK: - Helpers

private extension ButtonTests {
    func makeTemplateWithAllButtonStates(style: MisticaButtonStyle, inverse: Bool = false) -> some View {
        HStack {
            Spacer()

            VStack(alignment: .center) {
                Button("Normal") {}
                    .loading(false, title: "Loading title")
                    .padding()
                    .buttonStyle(style)

                Button("Disabled") {}
                    .loading(false, title: "Loading title")
                    .disabled(true)
                    .padding()
                    .buttonStyle(style)

                Button("Loading") {}
                    .loading(true, title: "Loading title")
                    .padding()
                    .buttonStyle(style)
            }

            Spacer()
        }
        .frame(minWidth: style.small ? 200 : 300)
        .background(inverse ? Color.backgroundBrand : Color.background)
    }
}
