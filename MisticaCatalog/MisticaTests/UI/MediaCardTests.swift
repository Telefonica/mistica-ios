//
//  MediaCardTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class MediaCardTests: XCTestCase {
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

    func testFullContentWithoutFragment() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(hasFragment: false)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentWithoutHeadline() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(headline: nil)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentWithoutTitle() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(title: nil)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testFullContentWithoutPretitle() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(pretitle: nil)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testTextsWithMultiLine() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non ligula vitae lorem finibus rutrum. Nam mi mi, ultrices ac aliquet id, hendrerit id magna.",
            pretitle: "Pellentesque vulputate vitae velit vitae elementum. Curabitur mollis metus orci, nec commodo sapien feugiat vitae. Phasellus egestas tincidunt leo sed luctus.",
            descriptionTitle: "Mauris vel nisi efficitur, fringilla urna at, gravida nunc. Sed eu dui sit amet est fringilla eleifend. Ut aliquam, tortor ac varius sodales"
        )

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testPrimaryButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard()

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    func testPrimaryAndLinkButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard(
            primaryButton: AnyValues.button, linkButton: AnyValues.link
        )

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    // MARK: Behaviour

    func testShowLoadingStateForButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(
            primaryButton: AnyValues.button, linkButton: AnyValues.link
        )
        view.primaryButton.isLoading = true

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true))
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivoNew

        let configurationWithActions = MediaCardConfiguration(
            richMedia: AnyValues.richMedia(),
            headline: "headline",
            title: "Item title",
            pretitle: "Pretitle",
            descriptionTitle: "This is a description",
            button: AnyValues.button,
            link: AnyValues.link
        )

        let view = MediaCardXIBIntegration.viewFromNib()
        view.card.contentConfiguration = configurationWithActions

        assertSnapshot(
            of: view.asRootOfViewController(),
            as: .image(on: .iPhoneX, drawHierarchyInKeyWindow: true)
        )
    }
}

// MARK: - Helpers

extension MediaCardTests {
    enum AnyValues {
        static let button = CardButton(title: "Button", loadingTitle: "Loading", tapHandler: nil)
        static let link = CardLinkButton(title: "Button Link", tapHandler: nil)
        @MainActor
        static func richMedia() -> UIImageView {
            let image = UIImageView(image: UIImage(color: .green))

            image.heightAnchor.constraint(equalToConstant: 110).isActive = true

            return image
        }
    }

    func makeBasicCard(primaryButton: CardButton? = nil,
                       linkButton: CardLinkButton? = nil) -> MediaCard {
        let configuration = MediaCardConfiguration(
            richMedia: AnyValues.richMedia(),
            descriptionTitle: "This is a description",
            button: primaryButton,
            link: linkButton
        )

        let view = MediaCard()
        view.contentConfiguration = configuration

        let cardSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        view.frame = CGRect(x: 0, y: 0, width: cardSize.width, height: cardSize.height)

        return view
    }

    func makeCardWithFullContentAndButtons(
        richMedia: UIView? = nil,
        headline: String? = "headline",
        title: String? = "Item title",
        pretitle: String? = "Pretitle",
        descriptionTitle: String = "This is a description",
        primaryButton: CardButton? = AnyValues.button,
        linkButton: CardLinkButton? = AnyValues.link,
        hasFragment: Bool = true
    ) -> MediaCard {
        let configuration = MediaCardConfiguration(
            richMedia: richMedia ?? AnyValues.richMedia(),
            headline: headline,
            title: title,
            pretitle: pretitle,
            descriptionTitle: descriptionTitle,
            button: primaryButton,
            link: linkButton
        )

        let view = MediaCard()
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
