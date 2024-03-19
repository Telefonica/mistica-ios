//
//  DataCardTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

final class DataCardTests: XCTestCase {
    private enum Constants {
        static let headline = "Headline"
        static let singleLineTitle = "Title"
        static let singleLineMessage = "Message"
        static let multiLineTitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        static let multiLineMessage = "Nam non ipsum id metus cursus dictum. Praesent efficitur erat libero, vitae tempus orci iaculis id. Proin ipsum ante, auctor mattis rutrum sit amet, elementum vitae quam. Praesent velit lectus, lacinia ut accumsan sit amet, convallis non leo. Ut quis facilisis sapien. "
    }

    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    func testAlternativeColors() {
        let dataCard = DataCard(
            assetType: .icon(
                image: Image(systemName: "plus"),
                foregroundColor: .neutralMedium,
                backgroundColor: .neutralLow
            ),
            title: "title",
            subtitle: "subtitle",
            description: nil,
            dismissAction: {},
            colorsConfiguration: .init(
                primaryTextColor: .textPrimaryInverse,
                secondaryTextColor: .textSecondaryInverse,
                backgroundColor: .backgroundBrand,
                borderColor: .border,
                dismissColor: .neutralLow
            )
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }
    
    func testSingleline() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            title: Constants.singleLineTitle,
            subtitle: Constants.singleLineMessage,
            description: Constants.singleLineMessage,
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testMultipleline() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            title: Constants.multiLineTitle,
            subtitle: Constants.multiLineTitle,
            description: Constants.multiLineMessage,
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testMinimumCard() {
        let dataCard = DataCard(
            title: Constants.singleLineTitle,
            description: Constants.singleLineMessage,
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: UIHostingController(rootView: dataCard),
            as: .image(on: .iPhone8)
        )
    }

    func testImage() {
        let dataCard = DataCard(
            assetType: .image(image: Image(systemName: "photo")),
            title: Constants.singleLineTitle,
            description: Constants.singleLineMessage,
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testIcon() {
        let dataCard = DataCard(
            assetType: .icon(image: Image(systemName: "photo"), foregroundColor: .red, backgroundColor: .blue),
            title: Constants.singleLineTitle,
            description: Constants.singleLineMessage,
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testIconNoBackground() {
        let dataCard = DataCard(
            assetType: .icon(image: Image(systemName: "photo"), foregroundColor: .red, backgroundColor: nil),
            title: Constants.singleLineTitle,
            description: Constants.singleLineMessage,
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testButtons() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            title: Constants.singleLineTitle,
            subtitle: Constants.singleLineMessage,
            description: Constants.singleLineMessage,
            primaryButton: { Button("Primary") {} },
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testNoButtons() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            title: Constants.singleLineTitle,
            subtitle: Constants.singleLineMessage,
            description: Constants.singleLineMessage
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testButtonAndFragment() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            title: Constants.singleLineTitle,
            subtitle: Constants.singleLineMessage,
            description: Constants.singleLineMessage,
            primaryButton: { Button("Primary") {} },
            linkButton: { Button("Link") {} },
            fragmentView: { Text("Fragment view") }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testFixedVerticalContentSize() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            title: Constants.singleLineTitle,
            subtitle: Constants.singleLineMessage,
            description: Constants.singleLineMessage,
            primaryButton: { Button("Primary") {} },
            linkButton: { Button("Link") {} },
            fragmentView: { Text("Fragment view") }
        )
        .fixedVerticalContentSize(true)
        .frame(width: 300, height: 400)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testNonFixedVerticalContentSize() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            title: Constants.singleLineTitle,
            subtitle: Constants.singleLineMessage,
            description: Constants.singleLineMessage,
            primaryButton: { Button("Primary") {} },
            linkButton: { Button("Link") {} },
            fragmentView: { Text("Fragment view") }
        )
        .fixedVerticalContentSize(false)
        .frame(width: 300, height: 400)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testDismissAction() {
        let dataCard = DataCard(
            title: Constants.singleLineTitle,
            subtitle: Constants.singleLineMessage,
            description: Constants.singleLineMessage,
            dismissAction: {},
            primaryButton: { Button("Primary") {} },
            linkButton: { Button("Link") {} }
        )
        .fixedVerticalContentSize(false)
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testTitleOnly() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            title: Constants.singleLineTitle,
            subtitle: Constants.singleLineMessage,
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }

    func testDescriptionOnly() {
        let dataCard = DataCard(
            headline: { Tag(style: .promo, text: Constants.headline) },
            subtitle: Constants.singleLineMessage,
            description: Constants.singleLineMessage,
            linkButton: { Button("Link") {} }
        )
        .frame(width: 300)
        .padding(16)

        assertSnapshot(
            matching: dataCard,
            as: .image
        )
    }
}
