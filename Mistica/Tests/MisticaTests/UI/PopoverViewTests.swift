//
//  PopoverViewTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class PopoverViewTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Styles

    func testBrandStyles() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: .init(width: 200, height: 100)),
            viewBuilder: makePopover(tipDirection: .down)
        )
    }

    // MARK: - Tip direction

    func testTipDirection() {
        let downPopover = makePopover(tipDirection: .down)

        assertSnapshot(
            matching: downPopover,
            as: .image(size: .init(width: 200, height: 100))
        )

        let upPopover = makePopover(tipDirection: .up)

        assertSnapshot(
            matching: upPopover,
            as: .image(size: .init(width: 200, height: 100))
        )
    }

    // MARK: - Title

    func testLargeTitle() {
        let popover = makePopover(tipDirection: .down, title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")

        assertSnapshot(
            matching: popover,
            as: .image(size: .init(width: 400, height: 150))
        )
    }

    func testNoTitle() {
        let popover = makePopover(tipDirection: .down, title: nil)

        assertSnapshot(
            matching: popover,
            as: .image(size: .init(width: 400, height: 150))
        )
    }

    // MARK: - Subtitle

    func testLargeSubtitle() {
        let popover = makePopover(tipDirection: .down, subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")

        assertSnapshot(
            matching: popover,
            as: .image(size: .init(width: 400, height: 150))
        )
    }

    func testNoSubtitle() {
        let popover = makePopover(tipDirection: .down, subtitle: nil)

        assertSnapshot(
            matching: popover,
            as: .image(size: .init(width: 400, height: 150))
        )
    }

    // MARK: - Title & Subtitle

    func testLargeTitleAndSubtitle() {
        let largeText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        let popover = makePopover(tipDirection: .down, title: largeText, subtitle: largeText)

        assertSnapshot(
            matching: popover,
            as: .image(size: .init(width: 400, height: 200))
        )
    }

    // MARK: - Image

    func testNoImage() {
        let popover = makePopover(tipDirection: .down, image: nil)

        assertSnapshot(
            matching: popover,
            as: .image(size: .init(width: 200, height: 100))
        )
    }

    // MARK: - Close

    func testNoClose() {
        let popover = makePopover(tipDirection: .down, canClose: false)

        assertSnapshot(
            matching: popover,
            as: .image(size: .init(width: 400, height: 150))
        )
    }
}

extension PopoverViewTests {
    func makePopover(
        tipDirection: PopoverView.TipDirection,
        title: String? = "Title",
        subtitle: String? = "Subtitle",
        image: UIImage? = .antenna,
        canClose: Bool = true
    ) -> UIViewController {
        let popOver = PopoverView()

        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false

        let vc = UIViewController()
        vc.view.addSubview(view)
        vc.view.backgroundColor = .white
        view.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        switch tipDirection {
        case .up:
            view.centerYAnchor.constraint(equalTo: vc.view.topAnchor).isActive = true
        case .down:
            view.centerYAnchor.constraint(equalTo: vc.view.bottomAnchor).isActive = true
        }

        let configuration = PopoverConfiguration(tipDirection: tipDirection, image: image, title: title, subtitle: subtitle, canClose: canClose)
        popOver.show(configuration: configuration, pointingAtView: view, in: vc.view, animated: false)

        return vc
    }
}
