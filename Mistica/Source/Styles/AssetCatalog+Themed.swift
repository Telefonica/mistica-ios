//
//  AssetCatalog+Themed.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    /// Returns an image for the provided asset type.
    /// The assets should be located in the appropiated asset catalog namespace
    ///
    /// - Parameters:
    ///   - brandedImageNamed: asset name
    ///   - type: if the asset can change per brand, theme or is common
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
    ///   - type: if the asset can change per brand, theme or is common
    convenience init?(named: String, type: AssetType) {
        let name = type.assetPath(named)
        self.init(name: name, bundle: .mistica)
    }
}

extension UIColor {
    /// Creates a color using the current theme variant.
    ///
    /// - Parameters:
    ///   - defaultColor: color used when the color for the current variant has not been provided
    ///   - variants: colors for different theme variants
    convenience init(_ defaultColor: UIColor, variants: [ThemeVariant: UIColor]) {
        if let current = variants[MisticaConfig.themeVariant] {
            self.init(cgColor: current.cgColor)
        } else {
            self.init(cgColor: defaultColor.cgColor)
        }
    }
}

private extension BrandStyle {
    /// Build an asset path based on the brand style (movistar, vivo..) and the theme variant (standard, prominent..)
    /// The image name with a 'path' format will be used to locate the asset in the asset catalog.
    ///
    /// - Parameters:
    ///   - name: asset name
    ///   - variant: brand style variant
    /// - Returns: path to asset inside the asset catalog
    func assetPath(_ name: String, variant: ThemeVariant) -> String {
        switch variant {
        case .standard:
            return "\(rawValue)/\(name)"
        default:
            return "\(rawValue)/\(variant.rawValue)/\(name)"
        }
    }
}

private extension AssetType {
    /// Build an asset path based on the asset type in case the asset can change per brand, theme or is common
    /// The image name with a 'path' format will be used to locate the asset in the asset catalog.
    ///
    /// - Parameter name: asset name
    /// - Returns: path to asset inside the asset catalog
    func assetPath(_ name: String) -> String {
        switch self {
        case .common:
            return name
        case .branded:
            return MisticaConfig.brandStyle.assetPath(name, variant: .standard)
        case .brandedAndThemed:
            return MisticaConfig.brandStyle.assetPath(name, variant: MisticaConfig.themeVariant)
        }
    }
}
