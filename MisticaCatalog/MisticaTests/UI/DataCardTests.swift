//
//  DataCardTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class DataCardTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: - Styles

    func testBrandStyles() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshotForAllBrandsAndStyles(as: .image(drawHierarchyInKeyWindow: true), viewBuilder: makeBasicCard())
    }

    // MARK: - Layout

    func testShowAssetOfTypeImage() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(asset: .image(.init(color: .cyan)))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testShowAssetOfTypeIcon() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(asset: .icon(.init(color: .cyan), backgroundColor: .black))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testMinimumContent() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard()

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContent() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons()

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentWithoutIcon() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(asset: .none)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentWithoutHeadline() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(headline: nil)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentWithoutSubtitle() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(subtitle: nil)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentWithoutFragment() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(hasFragment: false)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testTextsWithMultiLine() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non ligula vitae lorem finibus rutrum. Nam mi mi, ultrices ac aliquet id, hendrerit id magna.",
            subtitle: "Pellentesque vulputate vitae velit vitae elementum. Curabitur mollis metus orci, nec commodo sapien feugiat vitae. Phasellus egestas tincidunt leo sed luctus.",
            descriptionTitle: "Mauris vel nisi efficitur, fringilla urna at, gravida nunc. Sed eu dui sit amet est fringilla eleifend. Ut aliquam, tortor ac varius sodales"
        )

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testPrimaryButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard(buttons: .primary(AnyValues.button))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testPrimaryAndLinkButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard(buttons: .primaryAndLink(primary: AnyValues.button, link: AnyValues.link))

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    // MARK: Behaviour

    func testShowLoadingStateForButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(buttons: .primaryAndLink(primary: AnyValues.button, link: AnyValues.link))
        view.primaryButton.isLoading = true

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivoNew

        let configurationWithActions = DataCardConfiguration(
            title: "Title",
            descriptionTitle: "Description",
            buttons: .primaryAndLink(primary: AnyValues.button, link: AnyValues.link)
        )

        let view = DataCardXIBIntegration.viewFromNib()
        view.card.contentConfiguration = configurationWithActions

        assertSnapshot(
            of: view.asRootOfViewController(),
            as: .image(on: .iPhoneX, drawHierarchyInKeyWindow: true)
        )
    }
}

// MARK: - Helpers

extension DataCardTests {
    enum AnyValues {
        static let button = CardButton(title: "Button", loadingTitle: "Loading", tapHandler: nil)
        static let link = CardLinkButton(title: "Button Link", tapHandler: nil)
    }

    func makeBasicCard(buttons: DataCardConfiguration.Buttons = .link(AnyValues.link)) -> DataCard {
        let configuration = DataCardConfiguration(
            title: "Item title",
            descriptionTitle: "This is a description",
            buttons: buttons
        )

        let view = DataCard()
        view.contentConfiguration = configuration

        let cardSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        view.frame = CGRect(x: 0, y: 0, width: cardSize.width, height: cardSize.height)

        return view
    }

    func makeCardWithFullContentAndButtons(
        asset: DataCardConfiguration.AssetType = .image(.init(color: .green)),
        headline: String? = "headline",
        title: String = "Item title",
        subtitle: String? = "Subtitle",
        descriptionTitle: String = "This is a description",
        buttons: DataCardConfiguration.Buttons = .primaryAndLink(primary: AnyValues.button, link: AnyValues.link),
        hasFragment: Bool = true
    ) -> DataCard {
        let configuration = DataCardConfiguration(
            asset: asset,
            headline: headline,
            title: title,
            subtitle: subtitle,
            descriptionTitle: descriptionTitle,
            buttons: buttons
        )

        let view = DataCard()
        view.contentConfiguration = configuration

        if hasFragment {
            view.fragmentView = makeAFragmentView()
        }

        let cardSize = view.systemLayoutSizeFitting(
            CGSize(width: 300, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )
        view.frame = CGRect(x: 0, y: 0, width: cardSize.width, height: cardSize.height)

        return view
    }

    func makeAFragmentView() -> UIView {
        let parentView = UIView()
        parentView.backgroundColor = .gray

        let label = UILabel()
        label.text = "Hi, I am a text inside a fragment"
        label.numberOfLines = 0

        parentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
            parentView.heightAnchor.constraint(equalTo: label.heightAnchor, constant: 40)
        ])

        return parentView
    }
}
