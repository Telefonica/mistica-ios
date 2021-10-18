//
//  FontStyleTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import UIKit
import XCTest

final class FontStyleTests: XCTestCase {
    override class func setUp() {
        FontStyle.fontNameForWeight = { weight in
            switch weight {
            case .light, .ultraLight, .thin:
                return "Telefonica-Light"
            case .regular:
                return "Telefonica-Regular"
            case .medium, .bold, .semibold, .black, .heavy:
                return "Telefonica-Bold"
            default:
                return "Telefonica-Regular"
            }
        }
        // This is only needed because this is a test target
        FontLoader.loadCustomFonts(for: "otf")
    }

    override class func tearDown() {
        FontStyle.fontNameForWeight = nil
    }

    func testCustomFonts() {
        XCTAssertEqual(UIFont.textPreset1(weight: .regular).fontName, "Telefonica-Regular")
        XCTAssertEqual(UIFont.textPreset1(weight: .medium).fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset2(weight: .regular).fontName, "Telefonica-Regular")
        XCTAssertEqual(UIFont.textPreset2(weight: .medium).fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset3(weight: .light).fontName, "Telefonica-Light")
        XCTAssertEqual(UIFont.textPreset3(weight: .regular).fontName, "Telefonica-Regular")
        XCTAssertEqual(UIFont.textPreset3(weight: .medium).fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset4(weight: .light).fontName, "Telefonica-Light")
        XCTAssertEqual(UIFont.textPreset4(weight: .regular).fontName, "Telefonica-Regular")
        XCTAssertEqual(UIFont.textPreset4(weight: .medium).fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset5(weight: .light).fontName, "Telefonica-Light")
        XCTAssertEqual(UIFont.textPreset6(weight: .light).fontName, "Telefonica-Light")
        XCTAssertEqual(UIFont.textPreset6(weight: .regular).fontName, "Telefonica-Regular")
        XCTAssertEqual(UIFont.textPreset7(weight: .light).fontName, "Telefonica-Light")
        XCTAssertEqual(UIFont.textPreset8(weight: .light).fontName, "Telefonica-Light")
        XCTAssertEqual(UIFont.textPreset9(weight: .light).fontName, "Telefonica-Light")
        XCTAssertEqual(UIFont.textPreset10(weight: .light).fontName, "Telefonica-Light")
    }
}

class FontLoader {
    class func loadCustomFonts(for fontExtension: String) {
        let fileManager = FileManager.default
        let bundleURL = Bundle(for: FontLoader.self).bundleURL
        do {
            let contents = try fileManager.contentsOfDirectory(at: bundleURL, includingPropertiesForKeys: [], options: .skipsHiddenFiles)
            for url in contents {
                if url.pathExtension == fontExtension {
                    guard let fontData = NSData(contentsOf: url),
                          let provider = CGDataProvider(data: fontData),
                          let font = CGFont(provider) else {
                        continue
                    }

                    CTFontManagerRegisterGraphicsFont(font, nil)
                }
            }
        } catch {
            print("Error loading font: \(error)")
        }
    }
}
