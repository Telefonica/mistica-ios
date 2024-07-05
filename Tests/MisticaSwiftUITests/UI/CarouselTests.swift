//
//  CarouselTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

final class CarouselTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        isRecording = false
    }

    func testFree() {
        assertSnapshot(
            matching: givenCarousel(scrollStyle: .free),
            as: .image
        )
    }

    func testPaginated() {
        assertSnapshot(
            matching: givenCarousel(scrollStyle: .paginated),
            as: .image
        )
    }

    func testIndex() {
        assertSnapshot(
            matching: givenCarousel(index: .constant(1)),
            as: .image
        )
    }

    func testNoBullets() {
        assertSnapshot(
            matching: givenCarousel(controlStyle: .disabled),
            as: .image
        )
    }

    func testLeadingBullets() {
        assertSnapshot(
            matching: givenCarousel(controlStyle: .bullets, controlAlignment: .leading),
            as: .image
        )
    }

    func testTrailingBullets() {
        assertSnapshot(
            matching: givenCarousel(controlStyle: .bullets, controlAlignment: .trailing),
            as: .image
        )
    }

    func testFullWith() {
        assertSnapshot(
            matching: givenCarousel(carouselStyle: .fullWidth),
            as: .image
        )
    }
}

private extension CarouselTests {
    func givenCarousel(
        bullets: Int = 5,
        index: Binding<Int> = .constant(0),
        carouselStyle: CarouselStyle = .default,
        scrollStyle: CarouselScrollStyle = .paginated,
        controlStyle: CarouselControlStyle = .bullets,
        controlAlignment: Alignment? = nil,
        autoplay: CarouselAutoplay = .inactive
    ) -> some View {
        Carousel(0 ..< bullets, id: \.self, index: index, spacing: 0, headspace: 0) { item in
            Text("\(item)")
                .background(Color.red)
        }
        .carouselStyle(carouselStyle)
        .scrollStyle(scrollStyle)
        .controlsStyle(controlStyle, alignment: controlAlignment)
        .autoplay(autoplay)
        .frame(width: 100, height: 50)
        .padding()
    }
}
