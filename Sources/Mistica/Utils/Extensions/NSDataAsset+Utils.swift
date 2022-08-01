//
//  NSDataAsset+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Lottie
import UIKit

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
