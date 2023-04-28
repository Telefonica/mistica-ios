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
            matching: makeHeader(pretitle: HeaderText(text: "Only a pretitle")),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalPretitleHeaderInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                pretitle: HeaderText(text: "Only a pretitle")
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalTitleHeader() {
        assertSnapshot(
            matching: makeHeader(title: HeaderText(text: "Only a title")),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalTitleHeaderInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                title: HeaderText(text: "Only a title")
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalDescriptionHeader() {
        assertSnapshot(
            matching: makeHeader(descriptionValue: HeaderText(text: "Only a description")),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalDescriptionHeaderInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                descriptionValue: HeaderText(text: "Only a description")
            ),
            as: .image(on: .iPhoneSe)
        )
    }
}

extension HeaderTests {
    func testFullHeader() {
        assertSnapshot(
            matching: makeHeader(
                pretitle: HeaderText(text: "Pretitle"),
                title: HeaderText(text: "Title"),
                descriptionValue: HeaderText(text: "Description")
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithLongTexts() {
        assertSnapshot(
            matching: makeHeader(
                pretitle: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
                title: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
                descriptionValue: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithLongTextsAndLineLimitToTwo() {
        assertSnapshot(
            matching: makeHeader(
                pretitle: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2),
                title: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2),
                descriptionValue: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2)
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithAlternateColorsInverse() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                pretitle: HeaderText(text: "Pretitle"),
                title: HeaderText(text: "Title"),
                descriptionValue: HeaderText(text: "Description")
            ),
            as: .image(on: .iPhoneSe)
        )
    }
}

private extension HeaderTests {
    func makeHeader(
        style: HeaderViewStyle = .normal,
        pretitle: HeaderText? = nil,
        title: HeaderText? = nil,
        descriptionValue: HeaderText? = nil
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
        pretitle: HeaderText? = nil,
        title: HeaderText? = nil,
        descriptionValue: HeaderText? = nil,
        style: HeaderViewStyle = .normal
    ) {
        headerView.setUpView(
            pretitleText: pretitle,
            titleText: title,
            descriptionText: descriptionValue,
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
