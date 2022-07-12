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

    func testMovistarCustomFonts() {
		MisticaConfig.brandStyle = .movistar
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
        XCTAssertEqual(UIFont.textPreset5().fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset6().fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset7().fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset8().fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset9().fontName, "Telefonica-Bold")
        XCTAssertEqual(UIFont.textPreset10().fontName, "Telefonica-Bold")
    }

	func testOtherCustomFonts() {
		MisticaConfig.brandStyle = .vivo
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
		XCTAssertEqual(UIFont.textPreset5().fontName, "Telefonica-Light")
		XCTAssertEqual(UIFont.textPreset6().fontName, "Telefonica-Light")
		XCTAssertEqual(UIFont.textPreset7().fontName, "Telefonica-Light")
		XCTAssertEqual(UIFont.textPreset8().fontName, "Telefonica-Light")
		XCTAssertEqual(UIFont.textPreset9().fontName, "Telefonica-Light")
		XCTAssertEqual(UIFont.textPreset10().fontName, "Telefonica-Light")
	}
}

class FontLoader {
	class func loadCustomFonts(for fontExtension: String) {
		let fileManager = FileManager.default
		let bundleURL = Bundle(for: FontLoader.self).bundleURL
		guard let enumerator = fileManager.enumerator(at: bundleURL, includingPropertiesForKeys: [.isRegularFileKey], options: .skipsHiddenFiles) else {
			print("Error loading font")
			return
		}

		for case let url as URL  in enumerator {
			if url.pathExtension == fontExtension {
				guard let fontData = NSData(contentsOf: url),
					  let provider = CGDataProvider(data: fontData),
					  let font = CGFont(provider) else {
						  continue
					  }

				CTFontManagerRegisterGraphicsFont(font, nil)
			}
		}
	}
}
