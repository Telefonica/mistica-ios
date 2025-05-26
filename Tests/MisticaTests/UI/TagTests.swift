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
        assertSnapshotForAllBrandsAndStyles(
            as: .tagContainer(),
            viewBuilder: makeTemplateWithAllTags(isInverse: false)
        )
    }
    
    func testTagViewWithIcon() {
        assertSnapshotForAllBrandsAndStyles(
            as: .tagContainer(),
            viewBuilder: makeTemplateWithAllTags(isInverse: false, icon: .checkmarkIcon)
        )
    }

    func testInverseTagViewWithIcon() {
        assertSnapshotForAllBrandsAndStyles(
            as: .tagContainer(),
            viewBuilder: makeTemplateWithAllTags(isInverse: true, icon: .checkmarkIcon)
        )
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

extension Snapshotting where Value == UIView, Format == UIImage {
    public static func tagContainer() -> Snapshotting {
        Self.image(size: CGSize(width: 150.0, height: 33.0 * Double(TagStyle.allCases.count)))
    }
}

private extension TagTests {
    func makeTemplateWithAllTags(isInverse: Bool, icon: UIImage? = nil) -> UIView {
        let tags = TagStyle.allCases
            .map { style in
                TagView(
                    text: style.rawValue,
                    style: style,
                    isInverse: isInverse,
                    icon: icon
                )
            }
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        tags.forEach { stackView.addArrangedSubview($0) }
        return stackView
    }
}
