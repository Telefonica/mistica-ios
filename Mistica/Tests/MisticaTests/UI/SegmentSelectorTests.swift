//
//  SegmentSelectorTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class SegmentSelectorTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    func testSegmentsInSegmentSelector() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 320, height: 49)),
            viewBuilder: makeSegmentSelector(segments: 5, hasSelectedItem: false)
        )
    }

    func testSelectedSegmentsInSegmentSelector() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 320, height: 49)),
            viewBuilder: makeSegmentSelector(segments: 5, hasSelectedItem: true)
        )
    }

    func makeSegmentSelector(segments: Int, hasSelectedItem: Bool) -> SegmentSelector {
        let segments = (0 ..< segments).map { Segment(id: "\($0)", title: "Segment") }
        let segmentSelector = SegmentSelector(segments: segments)
        if hasSelectedItem, let segment = segments.first {
            segmentSelector.select(segment)
        }
        return segmentSelector
    }
}
