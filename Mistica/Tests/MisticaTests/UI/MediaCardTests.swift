//
//  MediaCardTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class MediaCardTests: XCTestCase {
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

    func testFullContentWithoutFragment() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(hasFragment: false)

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutHeadline() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(headline: nil)

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutTitle() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(title: nil)

        assertSnapshot(matching: view, as: .image)
    }

    func testFullContentWithoutPretitle() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(pretitle: nil)

        assertSnapshot(matching: view, as: .image)
    }

    func testTextsWithMultiLine() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non ligula vitae lorem finibus rutrum. Nam mi mi, ultrices ac aliquet id, hendrerit id magna.",
            pretitle: "Pellentesque vulputate vitae velit vitae elementum. Curabitur mollis metus orci, nec commodo sapien feugiat vitae. Phasellus egestas tincidunt leo sed luctus.",
            descriptionTitle: "Mauris vel nisi efficitur, fringilla urna at, gravida nunc. Sed eu dui sit amet est fringilla eleifend. Ut aliquam, tortor ac varius sodales"
        )

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryButtonsOnly() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard()

        assertSnapshot(matching: view, as: .image)
    }

    func testPrimaryAndLinkButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeBasicCard(
            primaryButton: AnyValues.button, linkButton: AnyValues.link
        )

        assertSnapshot(matching: view, as: .image)
    }

    // MARK: Behaviour

    func testShowLoadingStateForButtons() {
        MisticaConfig.brandStyle = .movistar

        let view = makeCardWithFullContentAndButtons(
            primaryButton: AnyValues.button, linkButton: AnyValues.link
        )
        view.primaryButton.isLoading = true

        assertSnapshot(matching: view, as: .image)
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let configurationWithActions = MediaCardConfiguration(
            richMedia: AnyValues.richMedia,
            headline: "headline",
            title: "Title",
            pretitle: "movistar likes",
            descriptionTitle: "Description",
            button: AnyValues.button,
            link: AnyValues.link
        )

        let view = MediaCardXIBIntegration.viewFromNib()
        view.card.contentConfiguration = configurationWithActions

        assertSnapshot(
            matching: view.asRootOfViewController(),
            as: .image(on: .iPhoneX)
        )
    }
}

// MARK: - Helpers

extension MediaCardTests {
    enum AnyValues {
        static let button = CardButton(title: "Button", loadingTitle: "Loading", tapHandler: nil)
        static let link = CardLinkButton(title: "Button Link", tapHandler: nil)
        static var richMedia: UIImageView {
            let image = UIImageView(image: UIImage(color: .green))

            image.heightAnchor.constraint(equalToConstant: 120).isActive = true

            return image
        }
    }

    func makeBasicCard(primaryButton: CardButton? = nil,
                       linkButton: CardLinkButton? = nil) -> MediaCard {
        let configuration = MediaCardConfiguration(
            richMedia: AnyValues.richMedia,
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
        richMedia: UIView = AnyValues.richMedia,
        headline: String? = "headline",
        title: String? = "Item title",
        pretitle: String? = "Movistar Likes",
        descriptionTitle: String = "This is a description",
        primaryButton: CardButton? = AnyValues.button,
        linkButton: CardLinkButton? = AnyValues.link,
        hasFragment: Bool = true
    ) -> MediaCard {
        let configuration = MediaCardConfiguration(
            richMedia: richMedia,
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
