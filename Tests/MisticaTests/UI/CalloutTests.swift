//
//  CalloutTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class CalloutTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Styles

    func testBrandStyles() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshotForAllBrandsAndStyles(as: .image, viewBuilder: makeBasicCallout())
    }

    // MARK: - Layout

    func testShowAsset() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(
            withDescription: "This is a description",
            asset: .smallIcon(.init(color: .cyan)),
            title: "This is a title"
        )

        assertSnapshot(matching: view, as: .image)
    }

    func testMinimumContent() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCallout()

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContent() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons()

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutIcon() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(asset: .none)

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutTitle() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(title: nil)

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryButtonOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(actions: CalloutConfiguration.CalloutActions.primary(AnyValues.primary))

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryButtonOnlyWithoutAsset() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(asset: .none, actions: CalloutConfiguration.CalloutActions.primary(AnyValues.primary))

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryAndLinkButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(actions: CalloutConfiguration.CalloutActions.primaryAndLink(primary: AnyValues.primary, link: AnyValues.link))

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryAndLinkButtonsOnlyWithoutAsset() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(asset: .none, actions: CalloutConfiguration.CalloutActions.primaryAndLink(primary: AnyValues.primary, link: AnyValues.link))

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryAndSecondaryButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(actions: CalloutConfiguration.CalloutActions.primaryAndSecondary(primary: AnyValues.primary, secondary: AnyValues.secondary))

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryAndSecondaryButtonsOnlyWithoutAsset() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(asset: .none, actions: CalloutConfiguration.CalloutActions.primaryAndSecondary(primary: AnyValues.primary, secondary: AnyValues.secondary))

        assertSnapshot(matching: view, as: .image)
    }

    func testSecondaryButtonOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(actions: CalloutConfiguration.CalloutActions.secondary(AnyValues.secondary))

        assertSnapshot(matching: view, as: .image)
    }

    func testSecondaryButtonOnlyWithoutAsset() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(asset: .none, actions: CalloutConfiguration.CalloutActions.secondary(AnyValues.secondary))

        assertSnapshot(matching: view, as: .image)
    }

    func testSecondaryAndLinkButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(actions: CalloutConfiguration.CalloutActions.secondaryAndLink(secondary: AnyValues.secondary, link: AnyValues.link))

        assertSnapshot(matching: view, as: .image)
    }

    func testSecondaryAndLinkButtonsOnlyWithoutAsset() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(asset: .none, actions: CalloutConfiguration.CalloutActions.secondaryAndLink(secondary: AnyValues.secondary, link: AnyValues.link))

        assertSnapshot(matching: view, as: .image)
    }

    func testLinkButtonOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(actions: CalloutConfiguration.CalloutActions.link(AnyValues.link))

        assertSnapshot(matching: view, as: .image)
    }

    func testLinkButtonOnlyWithoutAsset() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(asset: .none, actions: CalloutConfiguration.CalloutActions.link(AnyValues.link))

        assertSnapshot(matching: view, as: .image)
    }

    // MARK: Behaviour

    func testShowLoadingStateForButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCalloutWithContentAndButtons(actions: CalloutConfiguration.CalloutActions.primaryAndLink(primary: AnyValues.primary, link: AnyValues.link))
        view.primaryButton.isLoading = true

        assertSnapshot(matching: view, as: .image)
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let configurationWithActions = CalloutConfiguration(
            title: "This is a title",
            description: "This is a description",
            actions: .primaryAndLink(primary: AnyValues.primary, link: AnyValues.link)
        )

        let view = CalloutXIBIntegration.viewFromNib()
        view.callout.contentConfiguration = configurationWithActions

        assertSnapshot(
            matching: view.asRootOfViewController(),
            as: .image(on: .iPhoneX)
        )
    }
}

// MARK: - Helpers

extension CalloutTests {
    enum AnyValues {
        static let primary = CalloutButton(title: "Primary", loadingTitle: nil, tapHandler: nil)
        static let secondary = CalloutButton(title: "Secondary", loadingTitle: nil, tapHandler: nil)
        static let link = CalloutLinkButton(title: "Link", tapHandler: nil)
    }

    func makeBasicCallout() -> Callout {
        let configuration = CalloutConfiguration(asset: .none, title: nil, description: "This is a description", actions: nil, canClose: false)
        let callout = Callout()
        callout.contentConfiguration = configuration

        let calloutSize = callout.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        callout.frame = CGRect(x: 0, y: 0, width: calloutSize.width, height: calloutSize.height)

        return callout
    }

    func makeCalloutWithContentAndButtons(withDescription description: String? = "This is a description",
                                          asset: CalloutConfiguration.CalloutAssetType = .smallIcon(.init(color: .green)),
                                          title: String? = "Title",
                                          actions: CalloutConfiguration.CalloutActions = .primaryAndLink(primary: AnyValues.primary, link: AnyValues.link)) -> Callout {
        let configuration = CalloutConfiguration(asset: asset, title: title, description: description!, actions: actions, canClose: true)

        let callout = Callout()
        callout.contentConfiguration = configuration

        let calloutSize = callout.systemLayoutSizeFitting(
            CGSize(width: 300, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )
        callout.frame = CGRect(x: 0, y: 0, width: calloutSize.width, height: calloutSize.height)

        return callout
    }
}
