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

@MainActor
final class SkeletonTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testLineSkeleton() {
        assertSnapshot(
            of: makeSkeletonTemplate(type: .line(width: 300)),
            as: .image
        )
    }

    func testTextSkeleton() {
        assertSnapshot(
            of: makeSkeletonTemplate(type: .text()),
            as: .image
        )
    }

    func testTextSkeletonWithCustomLines() {
        assertSnapshot(
            of: makeSkeletonTemplate(type: .text(numberOfLines: 5)),
            as: .image
        )
    }

    func testCircleSkeleton() {
        assertSnapshot(
            of: makeSkeletonTemplate(type: .circle(size: 40), containerWidth: 40),
            as: .image
        )
    }

    func testRowSkeleton() {
        assertSnapshot(
            of: makeSkeletonTemplate(type: .row),
            as: .image
        )
    }

    func testRectangleSkeleton() {
        assertSnapshot(
            of: makeSkeletonTemplate(type: .rectangle(size: CGSize(width: 360, height: 180), isRounded: true), containerWidth: 360),
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
