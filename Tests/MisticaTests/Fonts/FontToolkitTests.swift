//
//  FontToolkitTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import UIKit
import XCTest

final class FontToolkitTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    func testFonts() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplate()
        )
    }
}

private extension FontToolkitTests {
    func makeLabel(text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = .gray
        return label
    }

    func makeLabels() -> [UILabel] {
        var labels = [UILabel]()

        let textPreset1 = FontStyle.TextPreset1Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset1 \(weight)",
                font: .textPreset1(weight: weight)
            )
        }
        let textPreset2 = FontStyle.TextPreset2Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset2 \(weight)",
                font: .textPreset2(weight: weight)
            )
        }
        let textPreset3 = FontStyle.TextPreset3Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset3 \(weight)",
                font: .textPreset3(weight: weight)
            )
        }
        let textPreset4 = FontStyle.TextPreset4Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset4 \(weight)",
                font: .textPreset4(weight: weight)
            )
        }
        let textPreset5 = makeLabel(
            text: "textPreset5 \(FontStyle.TextPreset5Weight.default)",
            font: .textPreset5()
        )
        let textPreset6 = makeLabel(
            text: "textPreset6 \(FontStyle.TextPreset6Weight.default)",
            font: .textPreset6()
        )
        let textPreset7 = makeLabel(
            text: "textPreset7 \(FontStyle.TextPreset7Weight.default)",
            font: .textPreset7()
        )
        let textPreset8 = makeLabel(
            text: "textPreset8 \(FontStyle.TextPreset8Weight.default)",
            font: .textPreset8()
        )
        let textPreset9 = makeLabel(
            text: "textPreset9 \(FontStyle.TextPreset9Weight.default)",
            font: .textPreset9()
        )
        let textPreset10 = makeLabel(
            text: "textPreset10 \(FontStyle.TextPreset10Weight.default)",
            font: .textPreset10()
        )

        labels.append(contentsOf: textPreset1)
        labels.append(contentsOf: textPreset2)
        labels.append(contentsOf: textPreset3)
        labels.append(contentsOf: textPreset4)
        labels.append(textPreset5)
        labels.append(textPreset6)
        labels.append(textPreset7)
        labels.append(textPreset8)
        labels.append(textPreset9)
        labels.append(textPreset10)

        return labels
    }

    func makeTemplate() -> UIStackView {
        let vStack = UIStackView(arrangedSubviews: makeLabels())

        let expectedWidth = vStack.arrangedSubviews
            .map(\.intrinsicContentSize)
            .map(\.width)
            .reduce(CGFloat(0), CGFloat.maximum)
        let expectedHeight = vStack.arrangedSubviews
            .map(\.intrinsicContentSize)
            .map(\.height)
            .reduce(CGFloat(0), +)

        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.spacing = 0
        vStack.frame = CGRect(
            x: 0,
            y: 0,
            width: expectedWidth,
            height: expectedHeight
        )

        return vStack
    }
}
