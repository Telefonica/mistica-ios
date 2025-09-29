//
//  ControlsTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class ControlsTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: - Switch Style

    func testSwitchDefaultState() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeSwitchTemplate(isOn: false)
        )
    }

    func testSwitchOnState() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeSwitchTemplate(isOn: true)
        )
    }

    // MARK: - UISegmentedControl Style

    func testSegmentedControl() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeSegmentedControlTemplate()
        )
    }

    // MARK: - UITabBar Style

    func testTabBarControl() {
        let tabView = makeTabBarTemplate()
        assertSnapshot(
            of: tabView,
            as: .image(drawHierarchyInKeyWindow: true, size: CGSize(width: 420, height: 60))
        )

        tabView.overrideUserInterfaceStyle = .dark

        assertSnapshot(
            of: tabView,
            as: .image(drawHierarchyInKeyWindow: true, size: CGSize(width: 420, height: 60)),
            named: "with-dark-style"
        )
    }

    // MARK: - UIPageControl Style

    func testPageControl() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makePageControlTemplate()
        )
    }

    // MARK: - UISegmentedControl Behaviour

    func testSegmentedControlChangeSelectedSegment() {
        MisticaConfig.brandStyle = .o2New
        MisticaConfig.styleControls([.segmentedControl])

        let segmentedControl = createSegmentControl()
        segmentedControl.selectedSegmentIndex = 1

        assertSnapshot(
            of: segmentedControl,
            as: .image(drawHierarchyInKeyWindow: true, size: segmentedControl.intrinsicContentSize),
            named: "assertInitialState"
        )

        segmentedControl.selectedSegmentIndex = 3

        assertSnapshot(
            of: segmentedControl,
            as: .image(drawHierarchyInKeyWindow: true, size: segmentedControl.intrinsicContentSize),
            named: "finalState"
        )
    }

    // MARK: - UITabBarControl Behaviour

    func testTabBarControlChangeSelectedItem() {
        MisticaConfig.brandStyle = .vivoNew
        MisticaConfig.styleControls([.tabBar])

        let tabBarController = createTabBarController()
        tabBarController.selectedIndex = 1

        assertSnapshot(
            of: tabBarController,
            as: .image(drawHierarchyInKeyWindow: true, size: CGSize(width: 420, height: 60)),
            named: "assertInitialState"
        )

        tabBarController.selectedIndex = 2

        assertSnapshot(
            of: tabBarController,
            as: .image(drawHierarchyInKeyWindow: true, size: CGSize(width: 420, height: 60)),
            named: "finalState"
        )
    }

    // MARK: - UIPageControl Behaviour

    func testPageControlChangeCurrentPage() {
        MisticaConfig.brandStyle = .movistar
        MisticaConfig.styleControls([.pageControl])

        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 3

        assertSnapshot(
            of: pageControl,
            as: .image(drawHierarchyInKeyWindow: true, size: pageControl.intrinsicContentSize),
            named: "assertInitialState"
        )

        pageControl.currentPage = 1

        assertSnapshot(
            of: pageControl,
            as: .image(drawHierarchyInKeyWindow: true, size: pageControl.intrinsicContentSize),
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
