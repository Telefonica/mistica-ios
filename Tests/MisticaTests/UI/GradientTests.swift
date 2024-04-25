//
//  GradientTests.swift
//
//
//  Created by Alejandro Ruiz on 25/4/24.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class GradientTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    func testGradientInView() {
        let gradientView = UIView()
        gradientView.frame = .init(x: 0, y: 0, width: 300, height: 450)
        
        let misticaGradient: MisticaGradient = .init(colors: [.backgroundBrandBottom, .blue, .backgroundBrandSecondary], stops: [0, 0.5, 1], angle: 180)
        let misticaColor: MisticaColor = .gradient(misticaGradient)
        gradientView.setMisticaColorBackground(misticaColor)

        assertSnapshot(
            matching: gradientView,
            as: .image
        )
    }
}
