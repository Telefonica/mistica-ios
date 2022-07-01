import Foundation
import Shared

enum AssetType {
    // The asset is shared on all brands styles
    case common

    // The asset changes per brand style
    case branded
}

extension AssetType {
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
            return MisticaConfig.brandStyle.assetPath(name)
        }
    }
}

extension BrandStyle {
    /// Build an asset path based on the brand style (movistar, vivo..) and the theme variant (standard, prominent..)
    /// The image name with a 'path' format will be used to locate the asset in the asset catalog.
    ///
    /// - Parameters:
    ///   - name: asset name
    /// - Returns: path to asset inside the asset catalog
    func assetPath(_ name: String) -> String {
        "\(self.id)/\(name)"
    }
}
