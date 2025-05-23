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

@MainActor
final class FeedbackTests: XCTestCase {
    private enum Constants {
        static let singleLineTitle = "Title"
        static let singleLineSubtitle = "Subtitle"
        static let singleLineErrorReference = "Error reference: #95001"
        static let multiLineTitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        static let multiLineSubtitle = "Nam non ipsum id metus cursus dictum. Praesent efficitur erat libero, vitae tempus orci iaculis id. Proin ipsum ante, auctor mattis rutrum sit amet, elementum vitae quam. Praesent velit lectus, lacinia ut accumsan sit amet, convallis non leo. Ut quis facilisis sapien. "
        static let multiLineErrorReference = "Nam non ipsum id metus cursus dictum. Praesent efficitur erat libero, vitae tempus orci iaculis id. Proin ipsum ante, auctor mattis rutrum sit amet, elementum vitae quam. Praesent velit lectus, lacinia ut accumsan sit amet, convallis non leo. Ut quis facilisis sapien. "
        static let primartyActionTitle = "Primary Action"
        static let secondaryActionTitle = "Secondary Action"
        static let retryLoadingTitle = "Loading Title"
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: Simple views

    func testSuccessTitle() {
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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

    func testFeedbackTitleAndSubtitle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .feedback(icon: UIImage(systemName: "swift")!),
                title: Constants.singleLineTitle,
                subtitle: Constants.singleLineSubtitle,
                primaryAction: .none,
                secondaryAction: .none
            )
        )
    }

    func testErrorTitleSubtitleAndErrorReference() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .error,
                title: Constants.singleLineTitle,
                subtitle: Constants.singleLineSubtitle,
                errorReference: Constants.singleLineErrorReference,
                primaryAction: .none,
                secondaryAction: .none
            )
        )
    }

    // MARK: Multiline

    func testSuccessMultiline() {
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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

    func testErrorMultilineScrollWithErrorReference() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: feedbackViewController(
                style: .error,
                title: Constants.singleLineTitle,
                subtitle: Constants.singleLineSubtitle,
                errorReference: Constants.multiLineErrorReference,
                primaryAction: .button(title: Constants.primartyActionTitle, completion: {}),
                secondaryAction: .button(title: Constants.secondaryActionTitle, completion: {})
            )
        )
    }

    // MARK: Primary Button

    func testSuccessPrimaryButton() {
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        assertSnapshotForAllBrandsAndStyles(
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
        errorReference: String? = nil,
        primaryAction: FeedbackPrimaryAction,
        secondaryAction: FeedbackSecondaryAction,
        extraContent: UIView? = nil,
        modalPresentationStyle: UIModalPresentationStyle? = nil
    ) -> FeedbackViewController {
        let configuration = FeedbackConfiguration(
            style: style,
            title: title,
            subtitle: subtitle,
            errorReference: errorReference,
            primaryAction: primaryAction,
            secondaryAction: secondaryAction,
            extraContent: extraContent,
            modalPresentationStyle: modalPresentationStyle
        )
        return FeedbackViewController(configuration: configuration)
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
            label.font = .textPreset3(weight: .regular)
            label.numberOfLines = 0
            label.textColor = .lightGray
            stackView.addArrangedSubview(label)
        }
        return stackView
    }
}
