//
//  HighlightedCardTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
@testable import MisticaCommon
import SnapshotTesting
import XCTest

@MainActor
final class HighlightedCardTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: - Styles

    func testNormalStyleAndLinkButton() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeCard(actionButtonStyle: .link)
        )
    }

    func testNormalStyleAndPrimaryButton() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeCard(actionButtonStyle: .primary)
        )
    }

    func testNormalStyleAndSecondaryButton() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeCard(actionButtonStyle: .secondary)
        )
    }

    func testInverseStyleAndLinkButton() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeCard(
                style: .inverse,
                actionButtonStyle: .link
            )
        )
    }

    func testInverseStyleAndPrimaryButton() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeCard(
                style: .inverse,
                actionButtonStyle: .primary
            )
        )
    }

    func testInverseStyleAndSecondaryButton() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeCard(
                style: .inverse,
                actionButtonStyle: .secondary
            )
        )
    }

    // MARK: - Layout

    func testMultiline() {
        MisticaConfig.brandStyle = .movistar

        let card = makeCard(
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non felis ut magna scelerisque molestie. Integer ultrices, felis sed consectetur suscipit, ligula ligula sollicitudin mauris, non eleifend dui quam eget sapien.",
            subtitle: "Aenean consequat sit amet quam nec maximus. Duis lobortis purus a enim pellentesque, non molestie libero porta. Vestibulum finibus vehicula ex in varius. Morbi vitae dui ex. Quisque commodo libero non feugiat accumsan.",
            actionButtonStyle: .link
        )

        assertSnapshot(
            of: card,
            as: .image
        )
    }

    func testRightImageWithFillStyle() {
        MisticaConfig.brandStyle = .vivoNew

        let card = makeCard(
            title: "Lorem",
            subtitle: "Aenean",
            rightImage: UIImage.circle(diameter: 20, color: .purple),
            actionButtonStyle: .link
        )

        card.rightImageStyle = .fill

        assertSnapshot(
            of: card,
            as: .image
        )
    }

    func testRightImageWithFitStyle() {
        MisticaConfig.brandStyle = .vivoNew

        let card = makeCard(
            title: "Lorem",
            subtitle: "Aenean",
            rightImage: UIImage.circle(diameter: 20, color: .purple),
            actionButtonStyle: .link
        )

        card.rightImageStyle = .fit

        assertSnapshot(
            of: card,
            as: .image
        )
    }

    func testBackgroundImage() {
        MisticaConfig.brandStyle = .vivoNew

        let card = makeCard(
            title: "Lorem",
            subtitle: "Aenean",
            actionButtonStyle: .primary
        )

        card.backgroundImage = UIImage.circle(diameter: 30, color: .yellow)

        assertSnapshot(
            of: card,
            as: .image
        )
    }

    func testWithoutButton() {
        MisticaConfig.brandStyle = .vivoNew

        let card = makeCard(
            title: "Lorem",
            subtitle: "Aenean consequat sit amet quam nec maximus.",
            actionButtonStyle: .primary
        )

        card.showActionButton = false

        assertSnapshot(
            of: card,
            as: .image
        )
    }

    func testWithCloseButton() {
        MisticaConfig.brandStyle = .movistar

        let card = makeCard(
            title: "Lorem",
            subtitle: "Aenean consequat sit amet quam nec maximus.",
            actionButtonStyle: .primary
        )

        card.showCloseButton = true

        assertSnapshot(
            of: card,
            as: .image
        )
    }

    func testWithCloseButtonAndRightImage() {
        MisticaConfig.brandStyle = .movistar

        let card = makeCard(
            title: "Lorem",
            subtitle: "Aenean consequat sit amet quam nec maximus.",
            rightImage: .init(color: .red, width: 50, height: 10),
            actionButtonStyle: .primary
        )

        card.showCloseButton = true

        assertSnapshot(
            of: card,
            as: .image
        )
    }

    func testWithCloseButtonAndBackgroundImage() {
        MisticaConfig.brandStyle = .movistar

        let card = makeCard(
            title: "Lorem",
            subtitle: "Aenean consequat sit amet quam nec maximus.",
            actionButtonStyle: .primary
        )

        card.backgroundImage = .init(color: .red, width: 50, height: 10)
        card.showCloseButton = true

        assertSnapshot(
            of: card,
            as: .image
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivoNew

        let view = HighlightedCardXIBIntegration.viewFromNib()
        view.card.title = "Resolver problema técnico"
        view.card.subtitle = "Usa nuestra herramienta para resolver tus problemas técnicos"
        view.card.actionButtonTitle = "Empezar pruebas"

        assertSnapshot(
            of: view.asRootOfViewController(),
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }
}

// MARK: - Helpers

private extension HighlightedCardTests {
    func makeCard(
        style: HighlightedCardStyle = .normal,
        title: String = "Resolver problema técnico",
        subtitle: String = "Usa nuestra herramienta para resolver tus problemas técnicos",
        rightImage: UIImage? = nil,
        actionButtonTitle: String? = "Empezar pruebas",
        actionButtonStyle: HighlightedCard.ButtonStyle = .primary
    ) -> HighlightedCard {
        let view = HighlightedCard(
            title: title,
            subtitle: subtitle,
            rightImage: rightImage,
            actionButtonStyle: actionButtonStyle
        )

        view.style = style
        view.actionButtonTitle = actionButtonTitle

        let cardSize = view.systemLayoutSizeFitting(
            CGSize(width: 300, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )
        view.frame = CGRect(x: 0, y: 0, width: cardSize.width, height: cardSize.height)

        return view
    }
}
