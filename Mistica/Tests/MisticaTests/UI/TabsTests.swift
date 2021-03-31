//
//  TabsTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class TabsTests: XCTestCase {
    enum Constants {
        static let mobileWidth: CGFloat = 390
        static let tabletWidth: CGFloat = 768
        static let heightComponent: CGFloat = 56
        static let padding: CGFloat = 20

        static let longText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

        static let twoItem = [
            TabItem(title: "Movies", icon: .ticket, accessibilityIdentifier: nil),
            TabItem(title: "Phone", icon: .iPhone, accessibilityIdentifier: nil)
        ]

        static let threeItemWithoutIcon = [
            TabItem(title: "Movies", accessibilityIdentifier: nil),
            TabItem(title: "Phone", accessibilityIdentifier: nil),
            TabItem(title: "Offers", accessibilityIdentifier: nil)
        ]

        static let threeItem = [
            TabItem(title: "Movies", icon: .ticket, accessibilityIdentifier: nil),
            TabItem(title: "Phone", icon: .iPhone, accessibilityIdentifier: nil),
            TabItem(title: "TV", icon: .tv, accessibilityIdentifier: nil)
        ]

        static let threeItemWithLongTextAndNoIcon = [
            TabItem(title: Constants.longText, accessibilityIdentifier: nil),
            TabItem(title: Constants.longText, accessibilityIdentifier: nil),
            TabItem(title: Constants.longText, accessibilityIdentifier: nil)
        ]

        static let threeItemWithLongText = [
            TabItem(title: Constants.longText, icon: .ticket, accessibilityIdentifier: nil),
            TabItem(title: Constants.longText, icon: .iPhone, accessibilityIdentifier: nil),
            TabItem(title: Constants.longText, icon: .tv, accessibilityIdentifier: nil)
        ]

        static let eightItem = [
            TabItem(title: "Movies", icon: .ticket, accessibilityIdentifier: nil),
            TabItem(title: "Phone", icon: .iPhone, accessibilityIdentifier: nil),
            TabItem(title: "TV", icon: .tv, accessibilityIdentifier: nil),
            TabItem(title: "Internet of things", icon: .cpu, accessibilityIdentifier: nil),
            TabItem(title: "5G", icon: .antenna, accessibilityIdentifier: nil),
            TabItem(title: "Offers", icon: .flame, accessibilityIdentifier: nil)
        ]
    }

    override class func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    // MARK: - Mobile Width Styles

    func testWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.mobileWidth, tabItems: Constants.threeItem),
            as: .image
        )
    }

    func testNoIconWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.mobileWidth, tabItems: Constants.threeItemWithoutIcon),
            as: .image
        )
    }

    func testWithLongTextAndWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.mobileWidth, tabItems: Constants.threeItemWithLongText),
            as: .image
        )
    }

    func testWithLongTextAndNoIconWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.mobileWidth, tabItems: Constants.threeItemWithLongTextAndNoIcon),
            as: .image
        )
    }

    func testEightItemWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.mobileWidth, tabItems: Constants.eightItem),
            as: .image
        )
    }

    // MARK: - iPad Width Styles

    func testWithIpadWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.tabletWidth, tabItems: Constants.threeItem),
            as: .image
        )
    }

    func testTwoItemWithIpadWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.tabletWidth, tabItems: Constants.twoItem),
            as: .image
        )
    }

    func testWithLongTextAndWithIpadWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.tabletWidth, tabItems: Constants.threeItemWithLongText),
            as: .image
        )
    }

    func testEightItemWithIpadWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: makeTemplate(width: Constants.tabletWidth, tabItems: Constants.eightItem),
            as: .image
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .movistar

        let view = TabsXIBIntegration.viewFromNib()
        view.tabs.reload(with: Constants.twoItem)

        assertSnapshot(
            matching: view.asRootOfViewController(),
            as: .image(on: .iPhoneSe)
        )
    }
}

// MARK: - Helpers

private extension TabsTests {
    private func makeTemplate(width: CGFloat, tabItems: [TabItem]) -> UIView {
        let contentView = UIView(frame: CGRect(
            origin: .zero,
            size: CGSize(
                width: width,
                height: Constants.heightComponent + Constants.padding
            )
        ))
        contentView.backgroundColor = .black

        let tabView = TabsView(tabItems: tabItems)
        let size = CGSize(width: width, height: Constants.heightComponent)
        tabView.frame = CGRect(origin: CGPoint(x: 0, y: 10), size: size)

        contentView.addSubview(tabView)

        return contentView
    }
}

extension UIImage {
    static let tv = generateImage("4k.tv")
    static let ticket = generateImage("ticket.fill")
    static let iPhone = generateImage("iphone")
    static let flame = generateImage("flame")
    static let cpu = generateImage("cpu")
    static let antenna = generateImage("antenna.radiowaves.left.and.right")

    static func generateImage(_ name: String) -> UIImage? {
        if #available(iOSApplicationExtension 13.0, *) {
            return UIImage(systemName: name)
        } else {
            return nil
        }
    }
}
