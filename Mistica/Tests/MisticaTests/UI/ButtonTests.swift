//
//  ButtonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

#if os(iOS)

    import Mistica
    import SnapshotTesting
    import XCTest

    final class ButtonTests: XCTestCase {
        override class func setUp() {
            super.setUp()

            isRecording = false
        }

        func testPrimaryButtonWithMovistarBrandStyle() {
            MisticaConfig.brandStyle = .movistar

            let view = Button()
            view.title = "Hi"
            view.style = .primary

            assertSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 44)))
        }

        func testPrimaryButtonWithO2BrandStyle() {
            MisticaConfig.brandStyle = .o2

            let view = Button()
            view.title = "Hi"
            view.style = .primary

            assertSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 44)))
        }
    }

#endif
