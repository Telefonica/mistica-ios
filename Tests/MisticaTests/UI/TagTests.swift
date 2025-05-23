//
//  TagTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class TagTests: XCTestCase {
    override func setUp() {
        super.setUp()
        Task { @MainActor in
            UIView.setAnimationsEnabled(false)
        }
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testTagView() {
        let tags = TagStyle.allCases
            .map { style in
                TagView(
                    text: style.rawValue,
                    style: style,
                    isInverse: false,
                    icon: nil
                )
            }
        assertTagsSnapshot(tags)
    }

    func testTagViewWithIcon() {
        let tags = TagStyle.allCases
            .map { style in
                TagView(
                    text: style.rawValue,
                    style: style,
                    isInverse: false,
                    icon: .checkmarkIcon
                )
            }
        assertTagsSnapshot(tags)
    }

    func testInverseTagViewWithIcon() {
        let tags = TagStyle.allCases
            .map { style in
                TagView(
                    text: style.rawValue,
                    style: style,
                    isInverse: true,
                    icon: .checkmarkIcon
                )
            }
        assertTagsSnapshot(tags)
    }

    func testTagXibIntegration() {
        MisticaConfig.brandStyle = .movistar

        let view = TagXIBIntegration.viewFromNib()
        view.tagView.text = "Xib integration"

        assertSnapshot(
            of: view,
            as: .image
        )
    }
}

private extension TagTests {
    func assertTagsSnapshot(
        _ tags: [TagView],
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        tags.forEach { stackView.addArrangedSubview($0) }
        assertSnapshot(
            for: [.movistar],
            as: .image(size: CGSize(width: 150.0, height: 33.0 * Double(TagStyle.allCases.count))),
            file: file,
            testName: testName,
            line: line,
            viewBuilder: stackView
        )
    }
}
