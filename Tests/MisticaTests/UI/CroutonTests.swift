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

        if withTabBar {
            let tabBarController = UITabBarController()
            croutonViewController.tabBarItem = UITabBarItem(title: "Tab_1", image: nil, selectedImage: nil)
            let dummyViewController = UIViewController()
            dummyViewController.tabBarItem = UITabBarItem(title: "Tab_2", image: nil, selectedImage: nil)
            tabBarController.viewControllers = [croutonViewController, dummyViewController]

            if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = .lightGray
                tabBarController.tabBar.standardAppearance = appearance
                tabBarController.tabBar.scrollEdgeAppearance = appearance
            } else {
                tabBarController.tabBar.barTintColor = .lightGray
            }

            return tabBarController
        }

        return croutonViewController
    }

    func makeCroutonWithScrollView(withText text: String, actionTitle: String? = nil, style: CroutonStyle) -> UIViewController {
        let croutonViewController = ScrollViewCroutonViewController(
            text: text,
            style: style,
            action: actionTitle.map { ($0, $0, {}) }
        )

        return croutonViewController
    }
}
private class CroutonTestViewController: UIViewController {
    private let text: String
    private let action: CroutonController.ActionConfig?
    private let style: CroutonStyle

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let config = SnackbarConfig(
            title: text,
            dismissInterval: dismissInterval
        )

        CroutonController().showCrouton(
            config: config,
            style: style,
            rootViewController: { self }
        )
    }
}

private extension CroutonTestViewController {
    var dismissInterval: SnackbarDismissInterval {
        guard let action = action else {
            return .fiveSeconds
        }
            return .tenSeconds(SnackbarAction(title: action.text, handler: action.handler))
    }
}

private class ScrollViewCroutonViewController: UIViewController, CustomCroutonContainer {
    var customCroutonContainerView: UIView {
        return scrollView
    }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let text: String
    private let style: CroutonStyle
    private let action: CroutonController.ActionConfig?
    
    init(text: String, style: CroutonStyle, action: CroutonController.ActionConfig?) {
        self.text = text
        self.style = style
        self.action = action
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
            super.viewDidLoad()
            
            view.addSubview(scrollView)
        scrollView.backgroundColor = .lightGray
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 250),
        ])
            
            let config = SnackbarConfig(
                title: text,
                dismissInterval: dismissInterval
            )
            CroutonController.shared.showCrouton(
                config: config,
                style: style,
                rootViewController: { self }
            )
        }
}

private extension ScrollViewCroutonViewController {
    var dismissInterval: SnackbarDismissInterval {
        guard let action = action else {
            return .fiveSeconds
        }
        return .tenSeconds(SnackbarAction(title: action.text, handler: action.handler))
    }
}
