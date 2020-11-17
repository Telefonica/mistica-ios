//
//  ButtonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class ButtonTests: XCTestCase {
    func testPrimaryButtonWithMovistarBrandStyle() {
        MisticaConfig.brandStyle = .movistar

        let view = Button()
        view.title = "Hi"
        view.style = .primary

        assertSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 44)))
    }
}
