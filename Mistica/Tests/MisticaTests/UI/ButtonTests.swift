//
//  ButtonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class ButtonTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Styles

    // MARK: Regular Buttons

    func testRegularSizeWithPrimaryStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primary, isSmall: false)
        )
    }

    func testRegularSizeWithPrimaryClearStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primaryClear, isSmall: false)
        )
    }

    func testRegularSizeWithPrimaryInverseStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primaryInverse, isSmall: false)
        )
    }

    func testRegularSizeWithSecondaryStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .secondary, isSmall: false)
        )
    }

    func testRegularSizeWithSecondaryInverseStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .secondaryInverse, isSmall: false)
        )
    }

    func testRegularSizeWithDangerStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .danger, isSmall: false)
        )
    }

    func testRegularSizeWithLinkStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: false)
        )
    }

    func testRegularSizeWithLinkInverseStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: false)
        )
    }

    // MARK: Small Buttons

    func testSmallSizeWithPrimaryStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primary, isSmall: true)
        )
    }

    func testSmallSizeWithPrimaryClearStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primaryClear, isSmall: true)
        )
    }

    func testSmallSizeWithPrimaryInverseStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primaryInverse, isSmall: true)
        )
    }

    func testSmallSizeWithSecondaryStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .secondary, isSmall: true)
        )
    }

    func testSmallSizeWithSecondaryInverseStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .secondaryInverse, isSmall: true)
        )
    }

    func testSmallSizeWithDangerStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .danger, isSmall: true)
        )
    }

    func testSmallSizeWithLinkStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: true)
        )
    }

    func testSmallSizeWithLinkInverseStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: true)
        )
    }

    // MARK: - Layout

    func testTextIsAlwaysSingleLine() {
        MisticaConfig.brandStyle = .movistar

        let buttonNormalState = Button()
        buttonNormalState.title = "A very very very long long long long teeeext"
        buttonNormalState.state = .normal

        assertSnapshot(
            matching: buttonNormalState,
            as: .image(size: CGSize(width: 156, height: 48))
        )
    }

    func testLoadingTextIsAlwaysSingleLine() {
        MisticaConfig.brandStyle = .movistar

        let buttonNormalState = Button()
        buttonNormalState.loadingTitle = "A very very very long long long long teeeext"
        buttonNormalState.state = .normal

        assertSnapshot(
            matching: buttonNormalState,
            as: .image(size: buttonNormalState.intrinsicContentSize)
        )
    }

    func testMinimumWidth() {
        MisticaConfig.brandStyle = .vivo

        assertSnapshot(
            matching: makeTemplateWithRegularAndSmallButtons(),
            as: .image
        )
    }

    // MARK: Behaviour

    func testShowLoadingLabel() {
        MisticaConfig.brandStyle = .o2

        let buttonNormalState = Button()
        buttonNormalState.title = "Regular"
        buttonNormalState.loadingTitle = "Loading"

        assertSnapshot(
            matching: buttonNormalState,
            as: .image(size: buttonNormalState.intrinsicContentSize),
            named: "assertInitialState"
        )

        buttonNormalState.state = .loading

        assertSnapshot(
            matching: buttonNormalState,
            as: .image(size: buttonNormalState.intrinsicContentSize),
            named: "finalState"
        )
    }
}

// MARK: - Helpers

private func makeTemplateWithAllButtonStates(style: Button.Style, isSmall: Bool) -> UIView {
    let buttonNormalState = Button()
    buttonNormalState.title = "Normal"
    buttonNormalState.style = style
    buttonNormalState.state = .normal
    buttonNormalState.isSmall = isSmall

    let buttonDisabledState = Button()
    buttonDisabledState.title = "Disabled"
    buttonDisabledState.style = style
    buttonDisabledState.state = .disabled
    buttonDisabledState.isSmall = isSmall

    let buttonSelectedState = Button()
    buttonSelectedState.title = "Selected"
    buttonSelectedState.style = style
    buttonSelectedState.state = .selected
    buttonSelectedState.isSmall = isSmall

    let buttonLoadingState = Button()
    buttonLoadingState.loadingTitle = "Loading"
    buttonLoadingState.style = style
    buttonLoadingState.state = .loading
    buttonLoadingState.isSmall = isSmall

    let vStack = UIStackView(arrangedSubviews: [
        buttonNormalState,
        buttonSelectedState,
        buttonDisabledState,
        buttonLoadingState
    ])

    vStack.axis = .vertical
    vStack.alignment = .center
    vStack.spacing = 0
    vStack.frame = CGRect(
        x: 0,
        y: 0,
        width: buttonLoadingState.intrinsicContentSize.width,
        height: buttonLoadingState.intrinsicContentSize.height * 4
    )

    return vStack
}

private func makeTemplateWithRegularAndSmallButtons() -> UIStackView {
    let smallButton = Button()
    smallButton.title = "Small"
    smallButton.state = .normal
    smallButton.isSmall = true

    let regularButton = Button()
    regularButton.title = "Normal"
    regularButton.state = .normal

    let vStack = UIStackView(arrangedSubviews: [
        smallButton,
        regularButton
    ])

    vStack.axis = .vertical
    vStack.alignment = .center
    vStack.spacing = 0
    vStack.frame = CGRect(
        x: 0,
        y: 0,
        width: regularButton.intrinsicContentSize.width,
        height: regularButton.intrinsicContentSize.height + regularButton.intrinsicContentSize.height
    )

    return vStack
}
