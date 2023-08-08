//
//  ButtonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class ButtonTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    // MARK: - Styles

    // MARK: Regular Buttons

    func testRegularSizeWithPrimaryStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primary, isSmall: false)
        )
    }

    func testRegularSizeWithPrimaryClearStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primaryClear, isSmall: false)
        )
    }

    func testRegularSizeWithPrimaryInverseStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primaryInverse, isSmall: false)
        )
    }

    func testRegularSizeWithSecondaryStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .secondary, isSmall: false)
        )
    }

    func testRegularSizeWithSecondaryInverseStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .secondaryInverse, isSmall: false)
        )
    }

    func testRegularSizeWithDangerStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .danger, isSmall: false)
        )
    }

    func testRegularSizeWithLinkStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: false)
        )
    }

    func testRegularSizeWithLinkInverseStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: false)
        )
    }

    func testRegularSizeWithLinkWithChevronStyle() {
        isRecording = true
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: false, rightImage: .chevron)
        )
    }

    func testRegularSizeWithLinkInverseWithChevronStyle() {
        isRecording = true
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: false, rightImage: .chevron)
        )
    }

    // MARK: Small Buttons

    func testSmallSizeWithPrimaryStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primary, isSmall: true)
        )
    }

    func testSmallSizeWithPrimaryClearStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primaryClear, isSmall: true)
        )
    }

    func testSmallSizeWithPrimaryInverseStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primaryInverse, isSmall: true)
        )
    }

    func testSmallSizeWithSecondaryStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .secondary, isSmall: true)
        )
    }

    func testSmallSizeWithSecondaryInverseStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .secondaryInverse, isSmall: true)
        )
    }

    func testSmallSizeWithDangerStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .danger, isSmall: true)
        )
    }

    func testSmallSizeWithLinkStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: true)
        )
    }

    func testSmallSizeWithLinkInverseStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: true)
        )
    }

    func testSmallSizeWithLinkWithChevronStyle() {
        isRecording = true
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: true, rightImage: .chevron)
        )
    }

    func testSmallSizeWithLinkInverseWithChevronStyle() {
        isRecording = true
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: true, rightImage: .chevron)
        )
    }

    // MARK: - Layout

    func testTextIsAlwaysSingleLine() {
        MisticaConfig.brandStyle = .movistar

        let buttonNormalState = Button()
        buttonNormalState.title = "A very very very long long long long teeeext"

        assertSnapshot(
            matching: buttonNormalState,
            as: .image(size: CGSize(width: 156, height: 48))
        )
    }

    func testLoadingTextIsAlwaysSingleLine() {
        MisticaConfig.brandStyle = .movistar

        let buttonNormalState = Button()
        buttonNormalState.loadingTitle = "A very very very long long long long teeeext"
        buttonNormalState.isLoading = true

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

        buttonNormalState.isLoading = true

        assertSnapshot(
            matching: buttonNormalState,
            as: .image(size: buttonNormalState.intrinsicContentSize),
            named: "finalState"
        )
    }

    func testStartAndStopLoadingBacksToNormal() {
        MisticaConfig.brandStyle = .movistar

        let button = Button()
        button.title = "Regular"
        button.loadingTitle = "Loading"

        assertSnapshot(
            matching: button,
            as: .image(size: button.intrinsicContentSize),
            named: "assertInitialState"
        )

        button.isLoading = true
        button.isLoading = false

        assertSnapshot(
            matching: button,
            as: .image(size: button.intrinsicContentSize),
            named: "finalState"
        )
    }

    func testDisableAndEnableBacksToNormal() {
        MisticaConfig.brandStyle = .movistar

        let button = Button()
        button.title = "Regular"

        assertSnapshot(
            matching: button,
            as: .image(size: button.intrinsicContentSize),
            named: "assertInitialState"
        )

        button.isEnabled = false
        button.isEnabled = true

        assertSnapshot(
            matching: button,
            as: .image(size: button.intrinsicContentSize),
            named: "finalState"
        )
    }

    func testSelectAndDeselectBacksToNormal() {
        MisticaConfig.brandStyle = .movistar

        let button = Button()
        button.title = "Regular"

        assertSnapshot(
            matching: button,
            as: .image(size: button.intrinsicContentSize),
            named: "assertInitialState"
        )

        button.isSelected = true
        button.isSelected = false

        assertSnapshot(
            matching: button,
            as: .image(size: button.intrinsicContentSize),
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .o2

        let view = ButtonXIBIntegration.viewFromNib()
        view.buttonPinnedToSides.title = "Button pinned to sides"
        view.buttonPinnedToLeading.title = "Button pinned to leading"
        view.buttonPinnedToTrailing.title = "Button pinned to trailing"
        view.buttonPinnedToBottomIgnoringSafeArea.title = "Button pinned to bottom ignoring safe area"

        view.buttonCentered.title = "Button centered"
        view.buttonCentered.loadingTitle = "Button centered"
        view.buttonCentered.isLoading = true

        assertSnapshot(
            matching: view.asRootOfViewController(),
            as: .image(on: .iPhoneX) // We need a device with Safe Area
        )
    }
}

// MARK: - Helpers

private func makeTemplateWithAllButtonStates(style: Button.Style, isSmall: Bool, rightImage: Button.RightImage? = nil) -> UIView {
    let buttonNormalState = Button()
    buttonNormalState.title = "Normal"
    buttonNormalState.style = style
    buttonNormalState.isSmall = isSmall
    buttonNormalState.rightImage = rightImage

    let buttonDisabledState = Button()
    buttonDisabledState.title = "Disabled"
    buttonDisabledState.style = style
    buttonDisabledState.isEnabled = false
    buttonDisabledState.isSmall = isSmall
    buttonDisabledState.rightImage = rightImage

    let buttonSelectedState = Button()
    buttonSelectedState.title = "Selected"
    buttonSelectedState.style = style
    buttonSelectedState.isSelected = true
    buttonSelectedState.isSmall = isSmall
    buttonSelectedState.rightImage = rightImage

    let buttonLoadingState = Button()
    buttonLoadingState.loadingTitle = "Loading"
    buttonLoadingState.style = style
    buttonLoadingState.isLoading = true
    buttonLoadingState.isSmall = isSmall
    buttonLoadingState.rightImage = rightImage

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
    smallButton.isSmall = true

    let regularButton = Button()
    regularButton.title = "O"

    let linkButton = Button()
    linkButton.title = "O"
    linkButton.isSelected = true
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
