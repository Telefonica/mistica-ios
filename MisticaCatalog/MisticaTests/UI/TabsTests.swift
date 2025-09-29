//
//  TabsTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class TabsTests: XCTestCase {
    enum Constants {
        static let defaultWidth: CGFloat = 390
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

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: - Mobile Width Styles

    func testTabsDefaultState() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeTemplateView(tabItems: Constants.threeItem)
        )
    }

    func testWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.threeItem)
            ),
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testNoIconWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.threeItemWithoutIcon)
            ),
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testWithLongTextAndWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.threeItemWithLongText)
            ),
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testWithLongTextAndNoIconWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.threeItemWithLongTextAndNoIcon)
            ),
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testEightItemWithMobileWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.eightItem)
            ),
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - iPad Width Styles

    func testWithIpadWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.threeItem)
            ),
            as: .image(on: .iPadMini, drawHierarchyInKeyWindow: true)
        )
    }

    func testTwoItemWithIpadWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.twoItem)
            ),
            as: .image(on: .iPadMini, drawHierarchyInKeyWindow: true)
        )
    }

    func testWithLongTextAndWithIpadWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.threeItemWithLongText)
            ),
            as: .image(on: .iPadMini, drawHierarchyInKeyWindow: true)
        )
    }

    func testEightItemWithIpadWidth() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            of: TabsTestsViewController(
                tabsView: makeTemplateTabsView(tabItems: Constants.eightItem)
            ),
            as: .image(on: .iPadMini, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .movistar

        let view = TabsXIBIntegration.viewFromNib()
        view.tabs.reload(with: Constants.twoItem)

        assertSnapshot(
            of: view.asRootOfViewController(),
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }
}

// MARK: - Helpers

private extension TabsTests {
    private func makeTemplateView(tabItems: [TabItem]) -> UIView {
        let contentView = UIView(frame: CGRect(
            origin: .zero,
            size: CGSize(
                width: Constants.defaultWidth,
                height: Constants.heightComponent + Constants.padding
            )
        ))
        contentView.backgroundColor = .black

        let tabsView = TabsView(tabItems: tabItems)
        tabsView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(tabsView)
        NSLayoutConstraint.activate([
            tabsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tabsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tabsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding / 2)
        ])

        return contentView
    }

    private func makeTemplateTabsView(tabItems: [TabItem]) -> TabsView {
        let tabsView = TabsView(tabItems: tabItems)
        tabsView.translatesAutoresizingMaskIntoConstraints = false
        return tabsView
    }
}

private class TabsTestsViewController: UIViewController {
    enum Constants {
        static let padding: CGFloat = 20
    }

    private let tabsView: TabsView

    init(tabsView: TabsView) {
        self.tabsView = tabsView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        tabsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabsView)

        NSLayoutConstraint.activate([
            tabsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabsView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.padding)
        ])
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
        UIImage(systemName: name)
    }
}
