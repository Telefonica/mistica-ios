//
//  TabsTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@MainActor
final class TabsTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testTwoLongTabs() {
        let tabs = Tabs(givenLongTabsItem(count: 2), selection: .constant(0))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testTreeLongTabs() {
        let tabs = Tabs(givenLongTabsItem(count: 3), selection: .constant(0))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testTreeLongTabsAndSecondSelected() {
        let tabs = Tabs(givenLongTabsItem(count: 3), selection: .constant(1))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testFourLongTabsAndSecondSelected() {
        let tabs = Tabs(givenLongTabsItem(count: 4), selection: .constant(2))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testTwoShortTabs() {
        let tabs = Tabs(givenShortTabsItem(count: 2), selection: .constant(0))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testTreeShortTabs() {
        let tabs = Tabs(givenShortTabsItem(count: 3), selection: .constant(0))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testTreeShortTabsAndSecondSelected() {
        let tabs = Tabs(givenShortTabsItem(count: 3), selection: .constant(1))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testFourShortTabsAndSecondSelected() {
        let tabs = Tabs(givenShortTabsItem(count: 4), selection: .constant(2))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testThreeNoImageTabs() {
        let tabs = Tabs(givenNoImageTabsItem(count: 3), selection: .constant(0))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }

    func testFourNoImageTabs() {
        let tabs = Tabs(givenNoImageTabsItem(count: 4), selection: .constant(0))
            .frame(width: 400)

        assertSnapshot(
            of: tabs,
            as: .image
        )
    }
}

extension TabsTests {
    func givenLongTabsItem(count: Int) -> [TabItem] {
        givenTabsItem(count: count, text: "Large item text", image: Image(systemName: "photo"))
    }

    func givenShortTabsItem(count: Int) -> [TabItem] {
        givenTabsItem(count: count, text: "Text", image: Image(systemName: "photo"))
    }

    func givenNoImageTabsItem(count: Int) -> [TabItem] {
        givenTabsItem(count: count, text: "Text", image: nil)
    }

    func givenTabsItem(count: Int, text: String, image: Image?) -> [TabItem] {
        (0 ..< count).map { _ in
            TabItem(text: text, image: image)
        }
    }
}
