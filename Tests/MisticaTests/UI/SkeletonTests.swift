//
//  SkeletonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class SkeletonTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    func testLineSkeleton() {
        assertSnapshot(
            matching: makeSkeletonTemplate(type: .line(width: 300)),
            as: .image
        )
    }

    func testTextSkeleton() {
        assertSnapshot(
            matching: makeSkeletonTemplate(type: .text()),
            as: .image
        )
    }

    func testTextSkeletonWithCustomLines() {
        assertSnapshot(
            matching: makeSkeletonTemplate(type: .text(numberOfLines: 5)),
            as: .image
        )
    }

    func testCircleSkeleton() {
        assertSnapshot(
            matching: makeSkeletonTemplate(type: .circle(size: 40), containerWidth: 40),
            as: .image
        )
    }

    func testRowSkeleton() {
        assertSnapshot(
            matching: makeSkeletonTemplate(type: .row),
            as: .image
        )
    }

    func testRectangleSkeleton() {
        assertSnapshot(
            matching: makeSkeletonTemplate(type: .rectangle(size: CGSize(width: 360, height: 180), isRounded: true), containerWidth: 360),
            as: .image
        )
    }
}

private extension SkeletonTests {
    func makeSkeletonTemplate(type: SkeletonType, containerWidth: CGFloat = 300) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .white

        let skeleton = Skeleton(type: type)
        containerView.addSubview(skeleton)

        skeleton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skeleton.topAnchor.constraint(equalTo: containerView.topAnchor),
            skeleton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            skeleton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            skeleton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            skeleton.widthAnchor.constraint(equalToConstant: containerWidth)
        ])

        containerView.layoutIfNeeded()

        let size = skeleton.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        containerView.frame.size = CGSize(width: size.width, height: size.height)

        return containerView
    }
}
