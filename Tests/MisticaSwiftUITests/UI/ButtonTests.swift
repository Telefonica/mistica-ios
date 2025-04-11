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

@MainActor
final class ButtonTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: Regular Buttons

    func testRegularSizeWithPrimaryStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaPrimary(small: false)),
            as: .image
        )
    }

    func testRegularSizeWithPrimaryInverseStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaPrimaryInverse(small: false), inverse: true),
            as: .image
        )
    }

    func testRegularSizeWithSecondaryStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaSecondary(small: false)),
            as: .image
        )
    }

    func testRegularSizeWithSecondaryInverseStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaSecondaryInverse(small: false), inverse: true),
            as: .image
        )
    }

    func testRegularSizeWithDangerStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaDanger(small: false)),
            as: .image
        )
    }

    func testRegularSizeWithLinkStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaLink(small: false)),
            as: .image
        )
    }

    func testRegularSizeWithLinkInverseStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaLinkInverse(small: false), inverse: true),
            as: .image
        )
    }

    func testRegularSizeWithLinkWithChevron() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaLink(withChevron: true)),
            as: .image
        )
    }

    func testRegularSizeWithLinkInverseWithChevron() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaLinkInverse(withChevron: true), inverse: true),
            as: .image
        )
    }

    // MARK: Small Buttons

    func testSmallSizeWithPrimaryStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaPrimary(small: true)),
            as: .image
        )
    }

    func testSmallSizeWithPrimaryInverseStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaPrimaryInverse(small: true), inverse: true),
            as: .image
        )
    }

    func testSmallSizeWithSecondaryStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaSecondary(small: true)),
            as: .image
        )
    }

    func testSmallSizeWithSecondaryInverseStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaSecondaryInverse(small: true), inverse: true),
            as: .image
        )
    }

    func testSmallSizeWithDangerStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaDanger(small: true)),
            as: .image
        )
    }

    func testSmallSizeWithLinkStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaLink(small: true)),
            as: .image
        )
    }

    func testSmallSizeWithLinkInverseStyle() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaLinkInverse(small: true), inverse: true),
            as: .image
        )
    }

    func testSmallSizeWithLinkWithChevron() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaLink(small: true, withChevron: true)),
            as: .image
        )
    }

    func testSmallSizeWithLinkInverseWithChevron() {
        assertSnapshot(
            of: makeTemplateWithAllButtonStates(style: .misticaLinkInverse(small: true, withChevron: true), inverse: true),
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
        .background(inverse ? Color.brand : Color.background)
    }
}
