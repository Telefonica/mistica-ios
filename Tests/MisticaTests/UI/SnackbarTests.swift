//
//  SnackbarTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class SnackbarTests: XCTestCase {
    private let sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    func testInfoSnackbar() {
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbar(
                withText: sampleText,
                style: .info
            )
        )
    }

    func testInfoSnackbarWithShortActionTitle() {
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbar(
                withText: sampleText,
                actionTitle: "Nostrud",
                style: .info
            )
        )
    }

    func testInfoSnackbarWithLongActionTitle() {
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbar(
                withText: sampleText,
                actionTitle: "Excepteur sint occaecat cupidatat",
                style: .info
            )
        )
    }

    func testCriticalSnackbar() {
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbar(
                withText: sampleText,
                style: .critical
            )
        )
    }

    func testCriticalSnackbarWithShortActionTitle() {
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbar(
                withText: sampleText,
                actionTitle: "Nostrud",
                style: .critical
            )
        )
    }

    func testCriticalSnackbarWithLongActionTitle() {
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbar(
                withText: sampleText,
                actionTitle: "Excepteur sint occaecat cupidatat",
                style: .critical
            )
        )
    }

    func testInfoSnackbarWithBottomTabbar() {
        MisticaConfig.styleControls([.tabBar])
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbarWithBottomTabBar(
                withText: sampleText,
                style: .info
            )
        )
    }

    func testInfoSnackbarWithTopTabbar() {
        MisticaConfig.styleControls([.tabBar])
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbarWithTopTabBar(
                withText: sampleText,
                style: .info
            )
        )
    }

    func testInfoSnackbarWithScrollView() {
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSnackbarWithScrollView(
                withText: sampleText,
                style: .info
            )
        )
    }
}

private extension SnackbarTests {
    func makeSnackbar(withText text: String, actionTitle: String? = nil, style: SnackbarStyle) -> UIViewController {
        let snackbarViewController = SnackbarTestViewController(
            text: text,
            action: actionTitle.map { ($0, $0, {}) },
            style: style
        )
        return snackbarViewController
    }

    func makeSnackbarWithTopTabBar(withText text: String, actionTitle: String? = nil, style: SnackbarStyle) -> UIViewController {
        let viewController = makeSnackbar(withText: text, actionTitle: actionTitle, style: style)
        addTabBar(to: viewController, isTop: true)
        return viewController
    }

    func makeSnackbarWithBottomTabBar(withText text: String, actionTitle: String? = nil, style: SnackbarStyle) -> UIViewController {
        let viewController = makeSnackbar(withText: text, actionTitle: actionTitle, style: style)
        addTabBar(to: viewController, isTop: false)
        return viewController
    }

    func makeSnackbarWithScrollView(withText text: String, actionTitle: String? = nil, style: SnackbarStyle) -> UIViewController {
        ScrollViewSnackbarViewController(text: text, action: actionTitle.map { ($0, $0, {}) }, style: style)
    }

    private func addTabBar(to viewController: UIViewController, isTop: Bool) {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(tabBar)

        let topConstraint: NSLayoutConstraint
        if isTop {
            topConstraint = tabBar.topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor)
        } else {
            topConstraint = tabBar.bottomAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.bottomAnchor)
        }

        NSLayoutConstraint.activate([
            topConstraint,
            tabBar.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        let tabIcon = UIImage(systemName: "house.fill")
        let tabItem1 = UITabBarItem(title: isTop ? "TopTab_1" : "BottomTab_1", image: tabIcon, selectedImage: tabIcon)
        let tabItem2 = UITabBarItem(title: isTop ? "TopTab_2" : "BottomTab_2", image: tabIcon, selectedImage: tabIcon)
        tabBar.items = [tabItem1, tabItem2]
    }
}

private class BaseSnackbarViewController: UIViewController {
    let text: String
    let action: SnackbarController.ActionConfig?
    let style: SnackbarStyle

    init(text: String, action: SnackbarController.ActionConfig?, style: SnackbarStyle) {
        self.text = text
        self.action = action
        self.style = style
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var dismissInterval: SnackbarDismissInterval {
        action.map { .tenSeconds(SnackbarAction(title: $0.text, handler: $0.handler)) } ?? .fiveSeconds
    }
}

private class SnackbarTestViewController: BaseSnackbarViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        SnackbarController().showSnackbar(
            config: SnackbarConfig(title: text, dismissInterval: dismissInterval),
            style: style,
            rootViewController: { self }
        )
    }
}

private class ScrollViewSnackbarViewController: BaseSnackbarViewController, CustomSnackbarContainer {
    var customSnackbarContainerView: UIView { scrollView }
    private let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()

        SnackbarController.shared.showSnackbar(
            config: SnackbarConfig(title: text, dismissInterval: dismissInterval),
            style: style,
            rootViewController: { self }
        )
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .lightGray
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
