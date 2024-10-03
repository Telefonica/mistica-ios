//
//  Bundle+Mistica.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

// A helper to access the framework bundle
extension Bundle {
    #if SWIFT_PACKAGE
        static let mistica = Bundle.misticaCommon
    #else
        private final class Internal {}

        static let mistica = Bundle(for: Internal.self)
    #endif
}

// There is a bug when xcode automatically synthesize the bundle `Bundle.module` which makes previews to stops working when using assets from another modules.
// To fix the problem, we manually search for the bundle assets. https://developer.apple.com/forums/thread/664295
private class CurrentBundleFinder {}
private extension Bundle {
    static let misticaCommon: Bundle = {
        let bundleName = "Mistica_MisticaCommon"

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
