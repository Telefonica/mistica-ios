//
//  HeaderTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class HeaderTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
        MisticaConfig.brandStyle = .movistar
    }
}

// MARK: - Minimal header

extension HeaderTests {
    func testMinimalPretitleHeader() {
        assertSnapshot(
            matching: makeHeader(pretitle: "Only a pretitle"),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalPretitleHeaderInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                pretitle: "Only a pretitle"
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalTitleHeader() {
        assertSnapshot(
            matching: makeHeader(title: "Only a title"),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalTitleHeaderInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                title: "Only a title"
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalDescriptionHeader() {
        assertSnapshot(
            matching: makeHeader(descriptionValue: "Only a description"),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalDescriptionHeaderInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                descriptionValue: "Only a description"
            ),
            as: .image(on: .iPhoneSe)
        )
    }
}

extension HeaderTests {
    func testFullHeader() {
        assertSnapshot(
            matching: makeHeader(
                pretitle: "Pretitle",
                title: "Title",
                descriptionValue: "Description"
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithLongTexts() {
        assertSnapshot(
            matching: makeHeader(
                pretitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                descriptionValue: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithAlternateColorsInverse() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                pretitle: "Pretitle",
                title: "Title",
                descriptionValue: "Description"
            ),
            as: .image(on: .iPhoneSe)
        )
    }
}

private extension HeaderTests {
    func makeHeader(
        style: HeaderViewStyle = .normal,
        pretitle: String? = nil,
        title: String? = nil,
        descriptionValue: String? = nil
    ) -> UIViewController {
        let viewController = HeaderViewController()
        viewController.setUpView(
            pretitle: pretitle,
            title: title,
            descriptionValue: descriptionValue,
            style: style
        )
        return UINavigationController(rootViewController: viewController)
    }
}

private class HeaderViewController: UIViewController {
    let headerView = HeaderView()

    func setUpView(
        pretitle: String? = nil,
        title: String? = nil,
        descriptionValue: String? = nil,
        style: HeaderViewStyle = .normal
    ) {
        headerView.setUpView(
            pretitle: pretitle,
            title: title,
            descriptionValue: descriptionValue,
            style: style
        )
    }

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background

        view.addSubview(headerView, constraints: [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.applyMisticaStyle()
        title = "Header"
    }
}
