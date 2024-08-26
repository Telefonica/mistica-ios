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

func assertSnapshot<View: UserInterfaceStyling, Format>(
    for brands: [BrandStyle] = BrandStyle.allCases,
    and styles: [UIUserInterfaceStyle] = [.light, .dark],
    as snapshotting: Snapshotting<View, Format>,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line,
    viewBuilder: @autoclosure () -> View
) {
    for brand in brands {
        MisticaConfig.brandStyle = brand

        for style in styles {
            var view = viewBuilder()
            view.overrideUserInterfaceStyle = style
            assertSnapshot(
                matching: view,
                as: snapshotting,
                named: "with-\(brand)-\(style.testSuffix)-style",
                file: file,
                testName: testName,
                line: line
            )
        }
    }
}

protocol UserInterfaceStyling {
    var overrideUserInterfaceStyle: UIUserInterfaceStyle { get set }
}

extension UIView: UserInterfaceStyling {}
extension UIViewController: UserInterfaceStyling {}

private extension UIUserInterfaceStyle {
    var testSuffix: String {
        switch self {
        case .unspecified:
            "unspecified"
        case .light:
            "light"
        case .dark:
            "dark"
        @unknown default:
            "unknown"
        }
    }
}
