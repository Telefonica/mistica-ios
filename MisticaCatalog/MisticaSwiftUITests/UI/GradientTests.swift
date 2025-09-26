//
//  GradientTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@MainActor
final class GradientTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testGradientInView() {
        let misticaGradient: MisticaGradient = .init(colors: [.backgroundBrandBottom, .blue, .backgroundBrandSecondary], stops: [0, 0.5, 1], angle: 180)
        let misticaColor: MisticaColor = .gradient(misticaGradient)

        assertSnapshot(
            of: makeTemplate(misticaColor: misticaColor),
            as: .image
        )
    }
}

private extension GradientTests {
    func makeTemplate(
        misticaColor: MisticaColor
    ) -> some View {
        VStack {}
            .frame(width: 300, height: 450, alignment: .center)
            .background(EmptyView().misticaColorView(misticaColor))
    }
}
