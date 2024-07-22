//
//  SkeletonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

final class SkeletonTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testLineSkeleton() {
        let skeleton = Skeleton(type: .line(width: 300))

        assertSnapshot(
            matching: skeleton,
            as: .image
        )
    }

    func testTextSkeleton() {
        let skeleton = Skeleton(type: .text())
            .frame(width: 300)

        assertSnapshot(
            matching: skeleton,
            as: .image
        )
    }

    func testTextSkeletonWithCustomLines() {
        let skeleton = Skeleton(type: .text(numberOfLines: 5))
            .frame(width: 300)

        assertSnapshot(
            matching: skeleton,
            as: .image
        )
    }

    func testCircleSkeleton() {
        let skeleton = Skeleton(type: .circle(size: CGSize(width: 40, height: 40)))

        assertSnapshot(
            matching: skeleton,
            as: .image
        )
    }

    func testRowSkeleton() {
        let skeleton = Skeleton(type: .row)
            .frame(width: 300)

        assertSnapshot(
            matching: skeleton,
            as: .image
        )
    }

    func testRectangleSkeleton() {
        let skeleton = Skeleton(type: .rectangle(width: 360, height: 180, isRounded: true))

        assertSnapshot(
            matching: skeleton,
            as: .image
        )
    }
}
