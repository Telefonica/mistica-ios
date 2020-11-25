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
        buttonNormalState.state = .loading

        assertSnapshot(
            matching: buttonNormalState,
            as: .image(size: CGSize(width: 156, height: 48))
        )
    }

    func testMinimumWidth() {
        MisticaConfig.brandStyle = .vivo

        assertSnapshot(
            matching: makeTemplateWithRegularAndSmallButtonsAndLinkButton(),
            as: .image
        )
    }

    func testLinkStyleAndContentModeLeft() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplateAlignment(contentMode: .left),
            as: .image
        )
    }

    func testLinkStyleAndContentModeRight() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplateAlignment(contentMode: .right),
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

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .o2

        let view = ButtonXIBIntegration.viewFromNib()
        view.button.title = "Tap me!"

        assertSnapshot(
            matching: view,
            as: .image
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

private func makeTemplateWithRegularAndSmallButtonsAndLinkButton() -> UIStackView {
    let smallButton = Button()
    smallButton.title = "O"
    smallButton.state = .normal
    smallButton.isSmall = true

    let regularButton = Button()
    regularButton.title = "O"
    regularButton.state = .normal

    let linkButton = Button()
    linkButton.title = "O"
    linkButton.state = .selected
    linkButton.style = .link

    let vStack = UIStackView(arrangedSubviews: [
        smallButton,
        regularButton,
        linkButton
    ])

    let expectedWidth = vStack.arrangedSubviews
        .map(\.intrinsicContentSize)
        .map(\.width)
        .reduce(CGFloat(0), CGFloat.maximum)
    let expectedHeight = vStack.arrangedSubviews
        .map(\.intrinsicContentSize)
        .map(\.height)
        .reduce(CGFloat(0), +)

    vStack.axis = .vertical
    vStack.alignment = .center
    vStack.spacing = 0
    vStack.frame = CGRect(
        x: 0,
        y: 0,
        width: expectedWidth,
        height: expectedHeight
    )

    return vStack
}

private func makeTemplateAlignment(contentMode: UIView.ContentMode) -> UIView {
    let containerView = UIView()
    containerView.backgroundColor = .white

    let title = UILabel()
    title.text = "Lorem ipsum dolor sit amet"
    title.translatesAutoresizingMaskIntoConstraints = false

    let linkButton = Button()
    linkButton.title = "Link"
    linkButton.style = .link
    linkButton.contentMode = contentMode
    linkButton.translatesAutoresizingMaskIntoConstraints = false

    containerView.addSubview(title)
    containerView.addSubview(linkButton)

    NSLayoutConstraint.activate([
        title.topAnchor.constraint(equalTo: containerView.topAnchor),
        title.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
        title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
        linkButton.topAnchor.constraint(equalTo: title.bottomAnchor)
    ])

    switch contentMode {
    case .left:
        linkButton.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
    case .right:
        linkButton.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
    default:
        fatalError("Sorry but at the moment of implementing this, I only took into account left and right contentMode")
    }

    let expectedHeight = containerView.subviews
        .map(\.intrinsicContentSize)
        .map(\.height)
        .reduce(CGFloat(0), +)

    containerView.frame = CGRect(
        x: 0,
        y: 0,
        width: title.intrinsicContentSize.width + 10, // title width plus some margin
        height: expectedHeight
    )

    return containerView
}
