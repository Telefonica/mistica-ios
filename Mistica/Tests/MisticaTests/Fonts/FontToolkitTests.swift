//
//  FontToolkitTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import UIKit
import XCTest

final class FontToolkitests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    func testFonts() {
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
        let textPreset5 = FontStyle.TextPreset5Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset5 \(weight)",
                font: .textPreset5(weight: weight)
            )
        }
        let textPreset6 = FontStyle.TextPreset6Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset6 \(weight)",
                font: .textPreset6(weight: weight)
            )
        }
        let textPreset7 = FontStyle.TextPreset7Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset7 \(weight)",
                font: .textPreset7(weight: weight)
            )
        }
        let textPreset8 = FontStyle.TextPreset8Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset8 \(weight)",
                font: .textPreset8(weight: weight)
            )
        }
        let textPreset9 = FontStyle.TextPreset9Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset9 \(weight)",
                font: .textPreset9(weight: weight)
            )
        }
        let textPreset10 = FontStyle.TextPreset10Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset10 \(weight)",
                font: .textPreset10(weight: weight)
            )
        }

        labels.append(contentsOf: textPreset1)
        labels.append(contentsOf: textPreset2)
        labels.append(contentsOf: textPreset3)
        labels.append(contentsOf: textPreset4)
        labels.append(contentsOf: textPreset5)
        labels.append(contentsOf: textPreset6)
        labels.append(contentsOf: textPreset7)
        labels.append(contentsOf: textPreset8)
        labels.append(contentsOf: textPreset9)
        labels.append(contentsOf: textPreset10)

        assertSnapshot(
            matching: makeTemplate(labels),
            as: .image
        )
    }
}

private extension FontToolkitests {
    func makeLabel(text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = .gray
        return label
    }

    private func makeTemplate(_ labels: [UILabel]) -> UIStackView {
        let vStack = UIStackView(arrangedSubviews: labels)

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
