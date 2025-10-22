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
    private enum Constants {
        static let templateWidth: CGFloat = 300
        static let templateHeight: CGFloat = 450
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testOpaqueGradientInView() {
        let misticaGradient: MisticaGradient = .init(colors: [.backgroundBrandBottom, .blue, .backgroundBrandSecondary], stops: [0, 0.5, 1], angle: 180)
        let misticaColor: MisticaColor = .gradient(misticaGradient)

        assertSnapshot(
            of: makeOpaqueTemplate(misticaColor: misticaColor),
            as: .image
        )
    }

    func testTransparentGradientInView() {
        let misticaGradient: MisticaGradient = .init(colors: [.blue.withAlphaComponent(0.1), .blue.withAlphaComponent(0.9)], stops: [0, 1], angle: 180)
        let misticaColor: MisticaColor = .gradient(misticaGradient)

        assertSnapshot(
            of: makeTransparentTemplate(misticaColor: misticaColor),
            as: .image
        )
    }
}

private extension GradientTests {
    func makeOpaqueTemplate(
        misticaColor: MisticaColor
    ) -> some View {
        VStack {}
            .frame(width: Constants.templateWidth, height: Constants.templateHeight, alignment: .center)
            .background(EmptyView().misticaColorView(misticaColor))
    }

    func makeTransparentTemplate(
        misticaColor: MisticaColor
    ) -> some View {
        ZStack {
            VStack {}
                .frame(width: Constants.templateWidth, height: Constants.templateHeight, alignment: .center)
                .background(Color.red)
            VStack {}
                .frame(width: Constants.templateWidth, height: Constants.templateHeight, alignment: .center)
                .background(EmptyView().misticaColorView(misticaColor))
        }
    }
}
