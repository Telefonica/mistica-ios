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

@MainActor
final class HeaderTests: XCTestCase {
    override func setUp() {
        super.setUp()
        Task { @MainActor in
            UIView.setAnimationsEnabled(false)
        }

        MisticaConfig.brandStyle = .movistar
    }
    
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }
}

// MARK: - Minimal header

extension HeaderTests {
    func testMinimalPretitleHeader() {
        assertSnapshot(
            of: makeHeader(pretitle: HeaderText(text: "Only a pretitle")),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalPretitleHeaderInNavigationBar() {
        assertSnapshot(
            of: makeHeader(
                style: .inverse,
                pretitle: HeaderText(text: "Only a pretitle")
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalTitleHeader() {
        assertSnapshot(
            of: makeHeader(title: HeaderText(text: "Only a title")),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalTitleHeaderInNavigationBar() {
        assertSnapshot(
            of: makeHeader(
                style: .inverse,
                title: HeaderText(text: "Only a title")
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalDescriptionHeader() {
        assertSnapshot(
            of: makeHeader(descriptionValue: HeaderText(text: "Only a description")),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalDescriptionHeaderInNavigationBar() {
        assertSnapshot(
            of: makeHeader(
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
            of: makeHeader(
                pretitle: HeaderText(text: "Pretitle"),
                title: HeaderText(text: "Title"),
                descriptionValue: HeaderText(text: "Description")
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithLongTexts() {
        assertSnapshot(
            of: makeHeader(
                pretitle: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
                title: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
                descriptionValue: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithLongTextsAndLineLimitToTwo() {
        assertSnapshot(
            of: makeHeader(
                pretitle: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2),
                title: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2),
                descriptionValue: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2)
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithAlternateColorsInverse() {
        assertSnapshot(
            of: makeHeader(
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
        if let pretitle = pretitle {
            headerView.pretitle = pretitle
        }
        if let title = title {
            headerView.title = title
        }
        if let descriptionValue = descriptionValue {
            headerView.descriptionValue = descriptionValue
        }
        headerView.style = style
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
