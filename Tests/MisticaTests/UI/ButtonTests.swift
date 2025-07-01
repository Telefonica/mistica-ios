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

@MainActor
final class ButtonTests: XCTestCase {
    enum Constants {
        static let leftImage = UIImage(systemName: "plus")!
        static let rightImage = UIImage(systemName: "minus")!
    }

    override class func setUp() {
        super.setUp()

        Task { @MainActor in
            UIView.setAnimationsEnabled(false)
        }
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
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

    func testRegularSizeWithLinkDangerStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkDanger, isSmall: false)
        )
    }

    func testRegularSizeWithLinkDangerInverseStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkDangerInverse, isSmall: false)
        )
    }

    func testRegularSizeWithLinkWithChevronStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: false, rightImage: .chevron)
        )
    }

    func testRegularSizeWithLinkInverseWithChevronStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: false, rightImage: .chevron)
        )
    }

    func testRegularSizeWithLinkWithLeftImageStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: false, leftImage: true)
        )
    }

    func testRegularSizeWithLinkInverseWithLeftImageStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: false, leftImage: true)
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
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: true, rightImage: .chevron)
        )
    }

    func testSmallSizeWithLinkInverseWithChevronStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: true, rightImage: .chevron)
        )
    }

    func testSmallSizeWithLinkWithLeftImageStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .link, isSmall: true, leftImage: true)
        )
    }

    func testSmallSizeWithLinkInverseWithLeftImageStyle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .linkInverse, isSmall: true, leftImage: true)
        )
    }

    // MARK: - Layout

    func testTextIsAlwaysSingleLine() {
        MisticaConfig.brandStyle = .movistar

        let buttonNormalState = Button()
        buttonNormalState.title = "A very very very long long long long teeeext"

        assertSnapshot(
            of: buttonNormalState,
            as: .image(size: CGSize(width: 156, height: 48))
        )
    }

    func testLoadingTextIsAlwaysSingleLine() {
        MisticaConfig.brandStyle = .movistar

        let buttonNormalState = Button()
        buttonNormalState.loadingTitle = "A very very very long long long long teeeext"
        buttonNormalState.isLoading = true

        assertSnapshot(
            of: buttonNormalState,
            as: .image(size: CGSize(width: 156, height: 48))
        )
    }

    func testChevronOnLargeView() {
        MisticaConfig.brandStyle = .movistar

        let button = Button()
        button.title = "Title"
        button.style = .link
        button.rightImage = .chevron

        assertSnapshot(
            of: button,
            as: .image(size: CGSize(width: 500, height: 48))
        )
    }

    func testMinimumWidth() {
        MisticaConfig.brandStyle = .vivo

        assertSnapshot(
            of: makeTemplateWithRegularAndSmallButtonsAndLinkButton(),
            as: .image
        )
    }

    func testLinkStyleAndContentModeLeft() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: makeTemplateAlignment(contentMode: .left),
            as: .image
        )
    }

    func testLinkStyleAndContentModeRight() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: makeTemplateAlignment(contentMode: .right),
            as: .image
        )
    }

    // MARK: Behaviour

    func testShowLoadingLabel() {
        MisticaConfig.brandStyle = .o2New

        let buttonNormalState = Button()
        buttonNormalState.title = "Regular"
        buttonNormalState.loadingTitle = "Loading"

        assertSnapshot(
            of: buttonNormalState,
            as: .image(size: buttonNormalState.intrinsicContentSize),
            named: "assertInitialState"
        )

        buttonNormalState.isLoading = true

        assertSnapshot(
            of: buttonNormalState,
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
            of: button,
            as: .image(size: button.intrinsicContentSize),
            named: "assertInitialState"
        )

        button.isLoading = true
        button.isLoading = false

        assertSnapshot(
            of: button,
            as: .image(size: button.intrinsicContentSize),
            named: "finalState"
        )
    }

    func testDisableAndEnableBacksToNormal() {
        MisticaConfig.brandStyle = .movistar

        let button = Button()
        button.title = "Regular"

        assertSnapshot(
            of: button,
            as: .image(size: button.intrinsicContentSize),
            named: "assertInitialState"
        )

        button.isEnabled = false
        button.isEnabled = true

        assertSnapshot(
            of: button,
            as: .image(size: button.intrinsicContentSize),
            named: "finalState"
        )
    }

    func testSelectAndDeselectBacksToNormal() {
        MisticaConfig.brandStyle = .movistar

        let button = Button()
        button.title = "Regular"

        assertSnapshot(
            of: button,
            as: .image(size: button.intrinsicContentSize),
            named: "assertInitialState"
        )

        button.isSelected = true
        button.isSelected = false

        assertSnapshot(
            of: button,
            as: .image(size: button.intrinsicContentSize),
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .o2New

        let view = ButtonXIBIntegration.viewFromNib()
        view.buttonPinnedToSides.title = "Button pinned to sides"
        view.buttonPinnedToLeading.title = "Button pinned to leading"
        view.buttonPinnedToTrailing.title = "Button pinned to trailing"
        view.buttonPinnedToBottomIgnoringSafeArea.title = "Button pinned to bottom ignoring safe area"

        view.buttonCentered.title = "Button centered"
        view.buttonCentered.loadingTitle = "Button centered"
        view.buttonCentered.isLoading = true

        assertSnapshot(
            of: view.asRootOfViewController(),
            as: .image(on: .iPhoneX) // We need a device with Safe Area
        )
    }

    // MARK: Images

    func testLeftAndRightImages() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primary, isSmall: false, leftImage: true, rightImage: .custom(image: Constants.rightImage))
        )
    }

    func testLeftImageAndChevron() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithAllButtonStates(style: .primary, isSmall: false, leftImage: true, rightImage: .chevron)
        )
    }
}

// MARK: - Helpers

private extension ButtonTests {
    func makeTemplateWithAllButtonStates(style: Button.Style, isSmall: Bool, leftImage: Bool = false, rightImage: Button.RightImage? = nil) -> UIView {
        let leftImage = leftImage ? Button.LeftImage.custom(image: ButtonTests.Constants.leftImage) : nil

        let buttonNormalState = Button()
        buttonNormalState.title = "Normal"
        buttonNormalState.style = style
        buttonNormalState.isSmall = isSmall
        buttonNormalState.leftImage = leftImage
        buttonNormalState.rightImage = rightImage

        let buttonDisabledState = Button()
        buttonDisabledState.title = "Disabled"
        buttonDisabledState.style = style
        buttonDisabledState.isEnabled = false
        buttonDisabledState.isSmall = isSmall
        buttonDisabledState.leftImage = leftImage
        buttonDisabledState.rightImage = rightImage

        let buttonSelectedState = Button()
        buttonSelectedState.title = "Selected"
        buttonSelectedState.style = style
        buttonSelectedState.isSelected = true
        buttonSelectedState.isSmall = isSmall
        buttonSelectedState.leftImage = leftImage
        buttonSelectedState.rightImage = rightImage

        let buttonLoadingState = Button()
        buttonLoadingState.loadingTitle = "Loading"
        buttonLoadingState.style = style
        buttonLoadingState.isLoading = true
        buttonLoadingState.isSmall = isSmall
        buttonLoadingState.leftImage = leftImage
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

    func makeTemplateWithRegularAndSmallButtonsAndLinkButton() -> UIStackView {
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

    func makeTemplateAlignment(contentMode: UIView.ContentMode) -> UIView {
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
}
