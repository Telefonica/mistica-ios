//
//  BadgeTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class BadgeTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testFlagBadge() {
        assertSnapshotForAllBrandsAndStyles(as: .image, viewBuilder: makeFlagBadge())
    }

    func testNumericBadge() {
        assertSnapshotForAllBrandsAndStyles(as: .image, viewBuilder: makeNumericBadge())
    }

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .o2

        let view = BadgeXIBIntegration.viewFromNib()
        view.flagBadge.style = .flag
        view.firstNumericBadge.style = .numeric
        view.firstNumericBadge.value = 7
        view.secondNumericBadge.style = .numeric
        view.secondNumericBadge.value = 1_000

        assertSnapshot(of: view, as: .image)
    }
}

private extension BadgeTests {
    func makeFlagBadge() -> UIView {
        let badgeView = BadgeView(style: .flag)
        badgeView.sizeToFit()

        return badgeView
    }

    func makeNumericBadge() -> UIView {
        let badgesView = UIStackView()

        for index in 0 ... 10 {
            let badgeView = BadgeView(style: .numeric)
            badgeView.value = index
            badgesView.addArrangedSubview(badgeView)
        }

        let size = badgesView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        badgesView.frame = CGRect(origin: .zero, size: size)

        return badgesView
    }
}
