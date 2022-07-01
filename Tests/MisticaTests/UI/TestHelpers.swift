//
//  TestHelpers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
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

func assertSnapshotForAllBrandsAndStyles<View: UserInterfaceStyling, Format>(
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

        if #available(iOS 13.0, *) {
            var darkView = viewBuilder()
            darkView.overrideUserInterfaceStyle = .dark

            assertSnapshot(
                matching: darkView,
                as: snapshotting,
                named: "with-\(brand)-dark-style",
                file: file,
                testName: testName,
                line: line
            )
        }
    }
}

protocol UserInterfaceStyling {
    @available(iOS 13.0, *)
    var overrideUserInterfaceStyle: UIUserInterfaceStyle { get set }
}

extension UIView: UserInterfaceStyling {}
extension UIViewController: UserInterfaceStyling {}
