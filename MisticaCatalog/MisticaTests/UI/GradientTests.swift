//
//  GradientTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class GradientTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testGradientInView() {
        let gradientView = UIView()
        gradientView.frame = .init(x: 0, y: 0, width: 300, height: 450)

        let misticaGradient: MisticaGradient = .init(colors: [.backgroundBrandBottom, .blue, .backgroundBrandSecondary], stops: [0, 0.5, 1], angle: 180)
        let misticaColor: MisticaColor = .gradient(misticaGradient)
        gradientView.setMisticaColorBackground(misticaColor)

        assertSnapshot(
            of: gradientView,
            as: .image
        )
    }
}
