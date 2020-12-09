//
//  BadgeTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class BadgeTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    func testFlagBadge() {
        assertSnapshotForAllBrands(as: .image, viewBuilder: makeFlagBadge())
    }

    func testNumericBadge() {
        assertSnapshotForAllBrands(as: .image, viewBuilder: makeNumericBadge())
    }

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .o2

        let view = BadgeXIBIntegration.viewFromNib()
        view.flagBadge.style = .flag
        view.firstNumericBadge.style = .numeric
        view.firstNumericBadge.value = 7
        view.secondNumericBadge.style = .numeric
        view.secondNumericBadge.value = 1_000

        assertSnapshot(matching: view, as: .image)
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
