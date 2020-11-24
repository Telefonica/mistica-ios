//
//  TestHelpers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import UIKit

// MARK: - Public Helpers

func assertSnapshotForAllBrands<Format>(
    as snapshotting: Snapshotting<UIView, Format>,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line,
    viewBuilder: @autoclosure () -> UIView
) {
    _assertSnapshotForAllBrands(
        as: snapshotting,
        file: file,
        testName: testName,
        line: line,
        viewBuilder: viewBuilder()
    )
}

func assertSnapshotForAllBrands<Format>(
    as snapshotting: Snapshotting<UIViewController, Format>,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line,
    viewBuilder: @autoclosure () -> UIViewController
) {
    _assertSnapshotForAllBrands(
        as: snapshotting,
        file: file,
        testName: testName,
        line: line,
        viewBuilder: viewBuilder()
    )
}

// MARK: - Private Helpers

private func _assertSnapshotForAllBrands<View, Format>(
    as snapshotting: Snapshotting<View, Format>,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line,
    viewBuilder: @autoclosure () -> View
) {
    for brand in BrandStyle.allCases {
        MisticaConfig.brandStyle = brand

        assertSnapshot(
            matching: viewBuilder(),
            as: snapshotting,
            named: "with-\(brand)-style",
            file: file,
            testName: testName,
            line: line
        )
    }
}
