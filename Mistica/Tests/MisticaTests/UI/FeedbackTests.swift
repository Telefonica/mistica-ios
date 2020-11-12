//
//  FeedbackTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

#if os(iOS)

    @testable import Mistica
    import SnapshotTesting
    import XCTest

    final class FeedbackTests: XCTestCase {
        override class func setUp() {
            super.setUp()

            isRecording = false
        }

        func testSuccessWithoutPrimaryAction() {
            let successConfiguration = FeedbackConfiguration(style: .informative,
                                                             title: "Title",
                                                             subtitle: "Subtitle", primaryAction: .none)
            let view = FeedbackViewController(configuration: successConfiguration)
            
            assertSnapshot(matching: view, as: .image(on: .iPhoneX))
        }
    }

#endif
