//
//  FeedbackTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class FeedbackTests: XCTestCase {
    private enum Constants {
        static let singleLineTitle = "Title"
        static let singleLineSubtitle = "Subtitle"
        static let multiLineTitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        static let multiLineSubtitle = "Nam non ipsum id metus cursus dictum. Praesent efficitur erat libero, vitae tempus orci iaculis id. Proin ipsum ante, auctor mattis rutrum sit amet, elementum vitae quam. Praesent velit lectus, lacinia ut accumsan sit amet, convallis non leo. Ut quis facilisis sapien. "
        static let primartyActionTitle = "Primary Action"
        static let secondaryActionTitle = "Secondary Action"
        static let retryLoadingTitle = "Loading Title"
    }

    override class func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    // MARK: Simple views

    func testSuccessTitle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .success,
                title: Constants.singleLineTitle,
                subtitle: nil,
                primaryAction: .none,
                secondaryAction: .none
            )
        )
    }

    func testInformativeTitleAndSubtitle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .informative,
                title: Constants.singleLineTitle,
                subtitle: Constants.singleLineSubtitle,
                primaryAction: .none,
                secondaryAction: .none
            )
        )
    }

    func testErrorTitleAndSubtitle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .error,
                title: Constants.singleLineTitle,
                subtitle: Constants.singleLineSubtitle,
                primaryAction: .none,
                secondaryAction: .none
            )
        )
    }

    // MARK: Multiline

    func testSuccessMultiline() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .success,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .none,
                secondaryAction: .none
            )
        )
    }

    func testInformativeMultilineScroll() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .informative,
                title: Constants.multiLineTitle,
                subtitle: String(repeating: Constants.multiLineSubtitle, count: 20),
                primaryAction: .none,
                secondaryAction: .none
            )
        )
    }

    func testErrorMultilineScrollWithButtons() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .error,
                title: Constants.multiLineTitle,
                subtitle: String(repeating: Constants.multiLineSubtitle, count: 20),
                primaryAction: .button(title: Constants.primartyActionTitle, completion: {}),
                secondaryAction: .button(title: Constants.secondaryActionTitle, completion: {})
            )
        )
    }

    // MARK: Primary Button

    func testSuccessPrimaryButton() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .success,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .button(title: Constants.primartyActionTitle, completion: {}),
                secondaryAction: .none
            )
        )
    }

    func testInformativePrimaryButton() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .informative,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .button(title: Constants.primartyActionTitle, completion: {}),
                secondaryAction: .none
            )
        )
    }

    func testErrorPrimaryRetryButton() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .error,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .retryButton(
                    title: Constants.primartyActionTitle,
                    loadingTitle: Constants.retryLoadingTitle,
                    retryCompletion: { _ in }
                ),
                secondaryAction: .none
            )
        )
    }

    // MARK: Secondary Button

    func testSuccessSecondaryButton() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .success,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .none,
                secondaryAction: .button(title: Constants.secondaryActionTitle, completion: {})
            )
        )
    }

    func testInformativeSecondaryButtonLink() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .informative,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .none,
                secondaryAction: .link(title: Constants.secondaryActionTitle, completion: {})
            )
        )
    }

    func testErrorSecondaryButtonLink() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .error,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .none,
                secondaryAction: .link(title: Constants.secondaryActionTitle, completion: {})
            )
        )
    }

    // MARK: Button combinations

    func testSuccessPrimaryAndSecondaryButton() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .success,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .button(title: Constants.primartyActionTitle, completion: {}),
                secondaryAction: .button(title: Constants.secondaryActionTitle, completion: {})
            )
        )
    }

    func testInformativePrimaryAndSecondaryButtonLink() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .informative,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .button(title: Constants.primartyActionTitle, completion: {}),
                secondaryAction: .link(title: Constants.secondaryActionTitle, completion: {})
            )
        )
    }

    func testErrorPrimaryRetryAndSecondaryButtonLink() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .error,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .retryButton(
                    title: Constants.primartyActionTitle,
                    loadingTitle: Constants.retryLoadingTitle,
                    retryCompletion: { _ in }
                ),
                secondaryAction: .link(title: Constants.secondaryActionTitle, completion: {})
            )
        )
    }

    // MARK: Custom View

    func testSuccessPrimaryAndSecondaryButtonLinkCustomView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .success,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .button(title: Constants.primartyActionTitle, completion: {}),
                secondaryAction: .link(title: Constants.secondaryActionTitle, completion: {}),
                extraContent: buildExtraView()
            )
        )
    }

    func testInformativeSecondaryButtonLinkCustomView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .informative,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .none,
                secondaryAction: .link(title: Constants.secondaryActionTitle, completion: {}),
                extraContent: buildExtraView()
            )
        )
    }

    func testErrorSecondaryPrimaryButtonCustomView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .error,
                title: Constants.multiLineTitle,
                subtitle: Constants.multiLineSubtitle,
                primaryAction: .button(title: Constants.primartyActionTitle, completion: {}),
                secondaryAction: .button(title: Constants.secondaryActionTitle, completion: {}),
                extraContent: buildExtraView()
            )
        )
    }
}

private extension FeedbackTests {
    func feedbackViewController(
        style: FeedbackStyle = .success,
        title: String,
        subtitle: String?,
        primaryAction: FeedbackPrimaryAction,
        secondaryAction: FeedbackSecondaryAction,
        extraContent: UIView? = nil,
        shouldHideCloseButton: Bool = false,
        modalPresentationStyle: UIModalPresentationStyle? = nil
    ) -> FeedbackViewController {
        let configuration = FeedbackConfiguration(
            style: style,
            title: title,
            subtitle: subtitle,
            primaryAction: primaryAction,
            secondaryAction: secondaryAction,
            extraContent: extraContent,
            shouldHideCloseButton: shouldHideCloseButton,
            modalPresentationStyle: modalPresentationStyle
        )

        return FeedbackViewController(
            configuration: configuration,
            backButton: nil,
            closeButton: nil
        )
    }

    func buildExtraView() -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true

        let texts = [
            "👇 This extra view is optional",
            "✅ Any UIView is allowed here",
            "⚠️ It will always be placed below the subtitle",
            "🌀 It will be animated along the other text"
        ]

        texts.forEach { string in
            let label = UILabel()
            label.text = string
            label.font = .textPreset6(weight: .regular)
            label.numberOfLines = 0
            label.textColor = .lightGray
            stackView.addArrangedSubview(label)
        }
        return stackView
    }
}
