//
//  EmptyStatesTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class EmptyStatesTests: XCTestCase {
    override class func setUp() {
        super.setUp()
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: - Styles

    func testBrandStyles() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshotForAllBrandsAndStyles(as: .image(drawHierarchyInKeyWindow: true), viewBuilder: makeBasicEmptyState())
    }

    // MARK: - Layout

    func testMinimumContent() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicEmptyState()

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testShowActions() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(
            type: .default(.smallImage(AnyValues.smallImage)),
            title: AnyValues.title,
            description: AnyValues.description,
            actions: .primary(AnyValues.primary)
        )

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentAsACard() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(
            type: .card(.icon(AnyValues.iconImage)),
            title: AnyValues.title,
            description: AnyValues.description,
            actions: .primaryAndLink(primary: AnyValues.primary, link: AnyValues.link)
        )

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentWithoutDescription() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(description: nil)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testPrimaryButtonOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(actions: .primary(AnyValues.primary))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testPrimaryAndLinkButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(actions: .primaryAndLink(primary: AnyValues.primary, link: AnyValues.link))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testPrimaryAndLinkButtonsOnlyAsACard() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(actions: .primaryAndLink(primary: AnyValues.primary, link: AnyValues.link))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testSecondaryAndLinkButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(actions: .secondaryAndLink(secondary: AnyValues.secondary, link: AnyValues.link))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testSecondaryButtonOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(actions: .secondary(AnyValues.secondary))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testSecondaryButtonOnlyAsACard() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(type: .card(.icon(AnyValues.iconImage)), actions: .secondary(AnyValues.secondary))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testSecondaryAndLinkButtonsOnlyAsACard() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(type: .card(.icon(AnyValues.iconImage)), actions: .secondaryAndLink(secondary: AnyValues.secondary, link: AnyValues.link))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testEmptyButtonOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(actions: .empty)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testEmptyButtonOnlyAsACard() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(type: .card(.icon(AnyValues.iconImage)), actions: .empty)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testLinkButtonOnlyAsACard() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(type: .card(.icon(AnyValues.iconImage)), actions: .link(AnyValues.link))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    // MARK: Behaviour

    func testShowLoadingStateForButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeEmptyStateWithContentAndButtons(actions: .primaryAndLink(primary: AnyValues.primary, link: AnyValues.link))
        view.primaryButton.isLoading = true

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivoNew

        let configurationWithActions = EmptyStateConfiguration(
            type: .default(.fullWidthImage(AnyValues.fullImage)),
            title: AnyValues.title,
            description: AnyValues.description,
            actions: .primary(AnyValues.primary)
        )

        let view = EmptyStateXIBIntegration.viewFromNib()
        view.emptyState.contentConfiguration = configurationWithActions

        assertSnapshot(
            of: view.asRootOfViewController(),
            as: .image(on: .iPhoneX, drawHierarchyInKeyWindow: true)
        )
    }
}

// MARK: - Helpers

extension EmptyStatesTests {
    enum AnyValues {
        static let primary = EmptyStateButton(title: "Primary", loadingTitle: nil, tapHandler: nil)
        static let secondary = EmptyStateButton(title: "Secondary", loadingTitle: nil, tapHandler: nil)
        static let link = EmptyStateLinkButton(title: "Link", tapHandler: nil)
        static let smallImage = UIImage(color: .success, width: 112.0, height: 112.0)
        static let fullImage = UIImage(color: .success, width: 327.0, height: 184.0)
        static let iconImage = UIImage(color: .success, width: 64.0, height: 64.0)
        static let title: String = "This is a mandatory title"
        static let description: String = "This is a basic configuration for the empty state"
    }

    func makeBasicEmptyState() -> EmptyState {
        let configuration = EmptyStateConfiguration(
            type: .default(.smallImage(AnyValues.smallImage)),
            title: AnyValues.title,
            description: nil,
            actions: .empty
        )
        let emptyState = EmptyState()
        emptyState.contentConfiguration = configuration

        let emptyStateSize = emptyState.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        emptyState.frame = CGRect(x: 0, y: 0, width: emptyStateSize.width, height: emptyStateSize.height)

        return emptyState
    }

    func makeEmptyStateWithContentAndButtons(type: EmptyStateConfiguration.EmptyStateType = .default(.smallImage(AnyValues.smallImage)),
                                             title: String = AnyValues.title,
                                             description: String? = AnyValues.description,
                                             actions: EmptyStateConfiguration.EmptyStateActions = .primary(AnyValues.primary)) -> EmptyState {
        let configuration = EmptyStateConfiguration(type: type, title: title, description: description, actions: actions)

        let emptyState = EmptyState()
        emptyState.contentConfiguration = configuration

        let emptyStateSize = emptyState.systemLayoutSizeFitting(
            CGSize(width: 300, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )
        emptyState.frame = CGRect(x: 0, y: 0, width: emptyStateSize.width, height: emptyStateSize.height)

        return emptyState
    }
}
