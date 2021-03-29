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

func assertSnapshotForAllBrandsAndStyles<Format>(
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

extension UIView {
    func asRootOfViewController() -> UIViewController {
        let vc = UIViewController()
        vc.view = self
        return vc
    }
}

// MARK: - Private Helpers

private func _assertSnapshotForAllBrands<View: UserInterfaceStyling, Format>(
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
        
        guard #available(iOSApplicationExtension 13.0, *) else { return }

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

private protocol UserInterfaceStyling {
    @available(iOS 13.0, *)
    var overrideUserInterfaceStyle: UIUserInterfaceStyle { get set }
}

extension UIView: UserInterfaceStyling {}
extension UIViewController: UserInterfaceStyling {}
