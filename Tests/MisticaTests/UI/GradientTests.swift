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
    private enum Constants {
        static let gradientViewFrame: CGRect = .init(x: 0, y: 0, width: 300, height: 450)
    }

    override func invokeTest() {
        withSnapshotTesting(record: .missing) {
            super.invokeTest()
        }
    }

    func testOpaqueGradientInView() {
        let gradientView = UIView()
        gradientView.frame = Constants.gradientViewFrame

        let misticaGradient: MisticaGradient = .init(colors: [.backgroundBrandBottom, .blue, .backgroundBrandSecondary], stops: [0, 0.5, 1], angle: 180)
        let misticaColor: MisticaColor = .gradient(misticaGradient)
        gradientView.setMisticaColorBackground(misticaColor)

        assertSnapshot(
            of: gradientView,
            as: .image
        )
    }

    func testTransparentGradientInView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .red
        backgroundView.frame = Constants.gradientViewFrame

        let gradientView = UIView()
        gradientView.frame = Constants.gradientViewFrame

        let misticaGradient: MisticaGradient = .init(colors: [.blue.withAlphaComponent(0.1), .blue.withAlphaComponent(0.9)], stops: [0, 1], angle: 180)
        let misticaColor: MisticaColor = .gradient(misticaGradient)
        gradientView.setMisticaColorBackground(misticaColor)

        backgroundView.addSubview(gradientView)

        assertSnapshot(
            of: backgroundView,
            as: .image
        )
    }
}
