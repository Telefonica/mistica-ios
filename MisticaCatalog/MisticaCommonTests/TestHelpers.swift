//
//  TestHelpers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
import SnapshotTesting
import UIKit

// MARK: - Public Helpers

extension UIView {
    func asRootOfViewController() -> UIViewController {
        let vc = UIViewController()
        vc.view = self
        return vc
    }
}

// MARK: - Helpers

@MainActor
func assertSnapshotForAllBrandsAndStyles<View: UserInterfaceStyling, Format>(
    as snapshotting: Snapshotting<View, Format>,
    file: StaticString = #filePath,
    testName: String = #function,
    line: UInt = #line,
    viewBuilder: @autoclosure () -> View
) {
    for brand in BrandStyle.allCases {
        MisticaConfig.brandStyle = brand

        assertSnapshot(
            of: viewBuilder(),
            as: snapshotting,
            named: "with-\(brand)-style",
            file: file,
            testName: testName,
            line: line
        )

        var darkView = viewBuilder()
        darkView.overrideUserInterfaceStyle = .dark

        assertSnapshot(
            of: darkView,
            as: snapshotting,
            named: "with-\(brand)-dark-style",
            file: file,
            testName: testName,
            line: line
        )
    }
}

@MainActor
protocol UserInterfaceStyling {
    var overrideUserInterfaceStyle: UIUserInterfaceStyle { get set }
}

extension UIView: UserInterfaceStyling {}
extension UIViewController: UserInterfaceStyling {}
