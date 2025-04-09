//
//  FilterTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class FilterTests: XCTestCase {
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

    func testSegmentsInFilter() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 320, height: 49)),
            viewBuilder: makeFilter(segments: 5, hasSelectedItem: false)
        )
    }

    func testSelectedSegmentsInFilter() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 320, height: 49)),
            viewBuilder: makeFilter(segments: 5, hasSelectedItem: true)
        )
    }

    func makeFilter(segments: Int, hasSelectedItem: Bool) -> Filter {
        let segments = (0 ..< segments).map { Segment(id: "\($0)", title: "Segment") }
        let filter = Filter(segments: segments)
        if hasSelectedItem, let segment = segments.first {
            filter.select(segment)
        }
        return filter
    }
}
