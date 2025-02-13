//
//  CroutonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class CroutonTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    func testInfoCrouton() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: .info
            )
        )
    }

    func testInfoCroutonWithShortActionTitle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                actionTitle: "Nostrud",
                style: .info
            )
        )
    }

    func testInfoCroutonWithLongActionTitle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                actionTitle: "Excepteur sint occaecat cupidatat",
                style: .info
            )
        )
    }

    func testCriticalCrouton() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: .critical
            )
        )
    }

    func testCriticalCroutonWithShortActionTitle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                actionTitle: "Nostrud",
                style: .critical
            )
        )
    }

    func testCriticalCroutonWithLongActionTitle() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                actionTitle: "Excepteur sint occaecat cupidatat",
                style: .critical
            )
        )
    }

    func testInfoCroutonWithTabbar() {
        MisticaConfig.styleControls([.tabBar])
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: .info,
                withTabBar: true
            )
        )
    }

    func testInfoCroutonWithScrollView() {
        assertSnapshot(
            for: [BrandStyle.movistar],
            and: [.light],
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCroutonWithScrollView(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: .info
            )
        )
    }
}

private extension CroutonTests {
    func makeCrouton(withText text: String, actionTitle: String? = nil, style: CroutonStyle, withTabBar: Bool = false) -> UIViewController {
        let croutonViewController = CroutonTestViewController(
            text: text,
            action: actionTitle.map { ($0, $0, {}) },
            style: style
        )

        guard withTabBar else { return croutonViewController }
        return createTabBarController(with: croutonViewController)
    }

    func makeCroutonWithScrollView(withText text: String, actionTitle: String? = nil, style: CroutonStyle) -> UIViewController {
        return ScrollViewCroutonViewController(
            text: text,
            action: actionTitle.map { ($0, $0, {}) }, style: style
        )
    }

    private func createTabBarController(with viewController: UIViewController) -> UITabBarController {
        let tabBarController = UITabBarController()
        let tabIcon = UIImage(systemName: "house.fill")

        viewController.tabBarItem = UITabBarItem(title: "Tab_1", image: tabIcon, selectedImage: tabIcon)
        let dummyViewController = UIViewController()
        dummyViewController.tabBarItem = UITabBarItem(title: "Tab_2", image: tabIcon, selectedImage: tabIcon)

        tabBarController.viewControllers = [viewController, dummyViewController]
        let topBorder = UIView(frame: CGRect(x: 0, y: 0, width: tabBarController.tabBar.frame.size.width, height: 1))
        topBorder.backgroundColor = .darkGray
        tabBarController.tabBar.addSubview(topBorder)
        
        return tabBarController
    }
}

private class BaseCroutonViewController: UIViewController {
    let text: String
    let action: CroutonController.ActionConfig?
    let style: CroutonStyle

    init(text: String, action: CroutonController.ActionConfig?, style: CroutonStyle) {
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
        return action.map { .tenSeconds(SnackbarAction(title: $0.text, handler: $0.handler)) } ?? .fiveSeconds
    }
}

private class CroutonTestViewController: BaseCroutonViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        CroutonController().showCrouton(
            config: SnackbarConfig(title: text, dismissInterval: dismissInterval),
            style: style,
            rootViewController: { self }
        )
    }
}

private class ScrollViewCroutonViewController: BaseCroutonViewController, CustomCroutonContainer {
    var customCroutonContainerView: UIView { scrollView }
    private let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        
        CroutonController.shared.showCrouton(
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
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
