import Foundation
import Lottie
import UIKit

extension NSDataAsset {
    /// Returns a datta asset for the provided asset type.
    /// The assets should be located in the appropiated asset catalog namespace
    ///
    /// - Parameters:
    ///   - brandedImageNamed: asset name
    ///   - type: if the asset can change per brand, theme or is common
    convenience init?(named: String, type: AssetType) {
        let name = type.assetPath(named)
        self.init(name: name, bundle: .module)
    }
}

extension Optional where Wrapped == NSDataAsset {
    var lottieAnimation: Lottie.Animation? {
        switch self {
        case .none:
            return nil
        case .some(let dataAsset):
            return try? JSONDecoder().decode(Lottie.Animation.self, from: dataAsset.data)
        }
    }
}
