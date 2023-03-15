//
//  AssetCatalog.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Lottie
import SwiftUI
import UIKit

extension UIImage {
    /// Returns an image for the provided asset type.
    /// The assets should be located in the appropiated asset catalog namespace
    ///
    /// - Parameters:
    ///   - brandedImageNamed: asset name
    ///   - type: if the asset can change per brand or is common
    convenience init?(named: String, type: AssetType) {
        let name = type.assetPath(named)
        self.init(named: name, in: .mistica, compatibleWith: nil)
    }
}

extension NSDataAsset {
    /// Returns a datta asset for the provided asset type.
    /// The assets should be located in the appropiated asset catalog namespace
    ///
    /// - Parameters:
    ///   - brandedImageNamed: asset name
    ///   - type: if the asset can change per brand or is common
    convenience init?(named: String, type: AssetType) {
        let name = type.assetPath(named)
        self.init(name: name, bundle: .mistica)
    }
}

extension Image {
    /// Returns an image for the provided asset type.
    /// The assets should be located in the appropriated asset catalog namespace
    ///
    /// - Parameters:
    ///   - brandedImageNamed: asset name
    ///   - type: if the asset can change per brand or is common
    init?(named: String, type: AssetType) {
        let name = type.assetPath(named)
        self.init(name, bundle: .mistica)
    }
}

private extension BrandStyle {
    /// Build an asset path based on the brand style (movistar, vivo..)
    /// The image name with a 'path' format will be used to locate the asset in the asset catalog.
    ///
    /// - Parameters:
    ///   - name: asset name
    /// - Returns: path to asset inside the asset catalog
    func assetPath(_ name: String) -> String {
        "\(id)/\(name)"
    }
}

private extension AssetType {
    /// Build an asset path based on the asset type in case the asset can change per brand or is common
    /// The image name with a 'path' format will be used to locate the asset in the asset catalog.
    ///
    /// - Parameter name: asset name
    /// - Returns: path to asset inside the asset catalog
    func assetPath(_ name: String) -> String {
        switch self {
        case .common:
            return name
        case .branded:
            return MisticaConfig.brandStyle.assetPath(name)
        }
    }
}
