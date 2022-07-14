//
//  Image+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
extension Image {
    /// Returns an image for the provided asset type.
    /// The assets should be located in the appropiated asset catalog namespace
    ///
    /// - Parameters:
    ///   - brandedImageNamed: asset name
    ///   - type: if the asset can change per brand, theme or is common
    init?(named: String, type: AssetType) {
        let name = type.assetPath(named)
        self.init(name, bundle: .assets)
    }
}

// There is a bug when xcode automatically synthesize the bundle `Bundle.module` which makes previews to stops working when using assets from another modules.
// To fix the problem, we manually search for the bundle assets. https://developer.apple.com/forums/thread/664295
private class CurrentBundleFinder {}
extension Foundation.Bundle {
    static var assets: Bundle = {
        let bundleName = "Mistica_Mistica"

        let candidates = [
            /* Bundle should be present here when the package is linked into an App. */
            Bundle.main.resourceURL,
            /* Bundle should be present here when the package is linked into a framework. */
            Bundle(for: CurrentBundleFinder.self).resourceURL,
            /* For command-line tools. */
            Bundle.main.bundleURL,
            /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent()
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named \(bundleName)")
    }()
}

@available(iOS 13.0, *)
public extension Image {
    init(color: Color) {
        self.init(uiImage: UIImage(color: color.uiColor))
    }
}
