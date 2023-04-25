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

    func testMinimalHeader() {
        assertSnapshot(
            matching: makeHeader(title: "Title"),
            as: .image(on: .iPhoneSe)
        )
    }

    func testMinimalHeaderInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                usingInLargeNavigationBar: true,
                title: "Title"
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeader() {
        assertSnapshot(
            matching: makeHeader(
                pretitle: "Pretitle",
                title: "Title",
                preAmount: "Pre-amount",
                amount: "0,00€",
                primaryActionTitle: "Primary Action",
                secondaryActionTitle: "Secondary Action",
                subtitle: "Subtitle"
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithLongTitle() {
        assertSnapshot(
            matching: makeHeader(
                pretitle: "Pretitle",
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                preAmount: "Pre-amount",
                amount: "0,00€",
                primaryActionTitle: "Primary Action",
                secondaryActionTitle: "Secondary Action",
                subtitle: "Subtitle"
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithAlternateColors() {
        assertSnapshot(
            matching: makeHeader(
                pretitle: "Pretitle",
                pretitleHasSecondaryColor: true,
                title: "Title",
                preAmount: "Pre-amount",
                preAmountHasSecondaryColor: true,
                amount: "0,00€",
                amountHasDangerColor: true,
                primaryActionTitle: "Primary Action",
                secondaryActionTitle: "Secondary Action",
                subtitle: "Subtitle",
                subtitleHasSecondaryColor: true
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithAlternateColorsInverse() {
        assertSnapshot(
            matching: makeHeader(
                style: .inverse,
                pretitle: "Pretitle",
                pretitleHasSecondaryColor: true,
                title: "Title",
                preAmount: "Pre-amount",
                preAmountHasSecondaryColor: true,
                amount: "0,00€",
                amountHasDangerColor: true,
                primaryActionTitle: "Primary Action",
                secondaryActionTitle: "Secondary Action",
                subtitle: "Subtitle",
                subtitleHasSecondaryColor: true
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                usingInLargeNavigationBar: true,
                pretitle: "Pretitle",
                title: "Title",
                preAmount: "Pre-amount",
                amount: "0,00€",
                primaryActionTitle: "Primary Action",
                secondaryActionTitle: "Secondary Action",
                subtitle: "Subtitle"
            ),
            as: .image(on: .iPhoneSe)
        )
    }

    func testFullHeaderWithAlternateColorsInNavigationBar() {
        assertSnapshot(
            matching: makeHeader(
                usingInLargeNavigationBar: true,
                pretitle: "Pretitle",
                pretitleHasSecondaryColor: true,
                title: "Title",
                preAmount: "Pre-amount",
                preAmountHasSecondaryColor: true,
                amount: "0,00€",
                amountHasDangerColor: true,
                primaryActionTitle: "Primary Action",
                secondaryActionTitle: "Secondary Action",
                subtitle: "Subtitle",
                subtitleHasSecondaryColor: true
            ),
            as: .image(on: .iPhoneSe)
        )
    }
}

private extension HeaderTests {
    func makeHeader(
        usingInLargeNavigationBar: Bool = false,
        style: HeaderViewStyle = .normal,
        pretitle: String? = nil,
        pretitleHasSecondaryColor: Bool = false,
        title: String,
        preAmount: String? = nil,
        preAmountHasSecondaryColor: Bool = false,
        amount: String? = nil,
        amountHasDangerColor: Bool = false,
        primaryActionTitle: String? = nil,
        secondaryActionTitle: String? = nil,
        subtitle: String? = nil,
        subtitleHasSecondaryColor: Bool = false
    ) -> UIViewController {
        let viewController = HeaderViewController()
        viewController.headerView.usingInLargeNavigationBar = usingInLargeNavigationBar
        viewController.headerView.style = style

        if let pretitle = pretitle {
            viewController.headerView.pretitle = pretitle
            viewController.headerView.pretitleHasSecondaryColor = pretitleHasSecondaryColor
        }

        viewController.headerView.title = title

        if let preAmount = preAmount {
            viewController.headerView.preAmount = preAmount
            viewController.headerView.preAmountHasSecondaryColor = preAmountHasSecondaryColor
        }

        if let amount = amount {
            viewController.headerView.amount = amount
            viewController.headerView.amountHasDangerColor = amountHasDangerColor
        }

        if let primaryActionTitle = primaryActionTitle {
            viewController.headerView.primaryActionTitle = primaryActionTitle
        }

        if let secondaryActionTitle = secondaryActionTitle {
            viewController.headerView.secondaryActionTitle = secondaryActionTitle
        }

        if let subtitle = subtitle {
            viewController.headerView.subtitle = subtitle
            viewController.headerView.subtitleHasSecondaryColor = subtitleHasSecondaryColor
        }

        return UINavigationController(rootViewController: viewController)
    }
}

private class HeaderViewController: UIViewController {
    let headerView = HeaderView()

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
