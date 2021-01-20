//
//  DataCardTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class DataCardTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Styles

    func testBrandStyles() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard()

        assertSnapshotForAllBrands(as: .image, viewBuilder: view)
    }

    // MARK: - Layout

    func testShowAssetOfTypeImage() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(asset: .image(.init(color: .cyan)))

        assertSnapshot(matching: view, as: .image)
    }

    func testShowAssetOfTypeIcon() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(asset: .icon(.init(color: .cyan), backgroundColor: .black))

        assertSnapshot(matching: view, as: .image)
    }

    func testMinimumContent() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard()

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContent() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons()

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutIcon() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(asset: nil)

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutHeadline() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(headline: nil)

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutSubtitle() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(subtitle: nil)

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutFragment() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(hasFragment: false)

        assertSnapshot(matching: view, as: .image)
    }

    func testTextsWithMultiLine() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non ligula vitae lorem finibus rutrum. Nam mi mi, ultrices ac aliquet id, hendrerit id magna.",
            subtitle: "Pellentesque vulputate vitae velit vitae elementum. Curabitur mollis metus orci, nec commodo sapien feugiat vitae. Phasellus egestas tincidunt leo sed luctus.",
            descriptionTitle: "Mauris vel nisi efficitur, fringilla urna at, gravida nunc. Sed eu dui sit amet est fringilla eleifend. Ut aliquam, tortor ac varius sodales"
        )

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard(buttons: .primary(AnyValues.button))

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryAndLinkButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard(buttons: .primaryAndLink(primary: AnyValues.button, link: AnyValues.link))

        assertSnapshot(matching: view, as: .image)
    }

    // MARK: Behaviour

    func testShowLoadingStateForButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(buttons: .primaryAndLink(primary: AnyValues.button, link: AnyValues.link))
        view.primaryButtonState = .loading

        assertSnapshot(matching: view, as: .image)
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let configurationWithActions = DataCardConfiguration(
            title: "Title",
            descriptionTitle: "Description",
            buttons: .primaryAndLink(primary: AnyValues.button, link: AnyValues.link)
        )

        let view = DataCardXIBIntegration.viewFromNib()
        view.card.contentConfiguration = configurationWithActions

        assertSnapshot(
            matching: view.asRootOfViewController(),
            as: .image(on: .iPhoneX)
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
        asset: DataCardConfiguration.AssetType? = .image(.init(color: .green)),
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
