//
//  ControlsTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class ControlsTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Switch Style

    func testSwitchDefaultState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeSwitchTemplate(isOn: false)
        )
    }

    func testSwitchOnState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeSwitchTemplate(isOn: true)
        )
    }

    // MARK: - UISegmentedControl Style

    func testSegmentedControl() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeSegmentedControlTemplate()
        )
    }

    // MARK: - UITabBar Style

    func testTabBarControl() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTabBarTemplate()
        )
    }

    // MARK: - UIPageControl Style

    func testPageControl() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makePageControlTemplate()
        )
    }

    // MARK: - UISegmentedControl Behaviour

    func testSegmentedControlChangeSelectedSegment() {
        MisticaConfig.brandStyle = .o2
        MisticaConfig.styleControls([.segmentedControl])

        let segmentedControl = createSegmentControl()
        segmentedControl.selectedSegmentIndex = 1

        assertSnapshot(
            matching: segmentedControl,
            as: .image(size: segmentedControl.intrinsicContentSize),
            named: "assertInitialState"
        )

        segmentedControl.selectedSegmentIndex = 3

        assertSnapshot(
            matching: segmentedControl,
            as: .image(size: segmentedControl.intrinsicContentSize),
            named: "finalState"
        )
    }

    // MARK: - UITabBarControl Behaviour

    func testTabBarControlChangeSelectedItem() {
        MisticaConfig.brandStyle = .vivo
        MisticaConfig.styleControls([.tabBar])

        let tabBarController = createTabBarController()
        tabBarController.selectedIndex = 1

        assertSnapshot(
            matching: tabBarController,
            as: .image(size: CGSize(width: 420, height: 60)),
            named: "assertInitialState"
        )

        tabBarController.selectedIndex = 2

        assertSnapshot(
            matching: tabBarController,
            as: .image(size: CGSize(width: 420, height: 60)),
            named: "finalState"
        )
    }

    // MARK: - UIPageControl Behaviour

    func testPageControlChangeCurrentPage() {
        MisticaConfig.brandStyle = .o2Classic
        MisticaConfig.styleControls([.pageControl])

        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 3

        assertSnapshot(
            matching: pageControl,
            as: .image(size: pageControl.intrinsicContentSize),
            named: "assertInitialState"
        )

        pageControl.currentPage = 1

        assertSnapshot(
            matching: pageControl,
            as: .image(size: pageControl.intrinsicContentSize),
            named: "finalState"
        )
    }
}

private extension ControlsTests {
    func makeSwitchTemplate(isOn: Bool) -> UIView {
        MisticaConfig.styleControls([.switch])
        let _switch = UISwitch()
        _switch.isOn = isOn
        return _switch
    }

    func makeSegmentedControlTemplate() -> UIView {
        MisticaConfig.styleControls([.segmentedControl])

        let segmentedControl = createSegmentControl()
        segmentedControl.selectedSegmentIndex = 1

        return segmentedControl
    }

    func makeTabBarTemplate() -> UIView {
        MisticaConfig.styleControls([.tabBar])

        let tabBarController = createTabBarController()
        tabBarController.selectedIndex = 1

        return tabBarController.view
    }

    func makePageControlTemplate() -> UIView {
        MisticaConfig.styleControls([.pageControl])

        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 3

        return pageControl
    }

    func createSegmentControl() -> UISegmentedControl {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Segment 1", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Segment 2", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Segment 3", at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: "Segment 4", at: 3, animated: true)

        return segmentedControl
    }

    func createTabBarController() -> UITabBarController {
        var tabs = [UIViewController]()
        for i in 0 ..< 3 {
            let tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: i)
            tabBarItem.title = "Tab \(i)"

            let viewController = UIViewController()
            viewController.tabBarItem = tabBarItem

            tabs.append(viewController)
        }

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = tabs

        return tabBarController
    }
}
