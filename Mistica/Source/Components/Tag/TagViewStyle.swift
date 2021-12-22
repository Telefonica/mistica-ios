//
//  TagViewStyle.swift
//  
//
//  Created by Jose Salavert on 21/12/21.
//

import Foundation
import UIKit

@frozen
public enum TagViewStyle: String, CaseIterable {
    case promo,
         active,
         inactive,
         success,
         warning,
         error,
         inverse
}

extension TagViewStyle {
    var backgroundColor: UIColor {
        switch self {
        case .promo:
            return .tagBackgroundPromo
        case .active:
            return .tagBackgroundActive
        case .inactive:
            return .tagBackgroundInactive
        case .success:
            return .tagBackgroundSuccess
        case .warning:
            return .tagBackgroundWarning
        case .error:
            return .tagBackgroundError
        case .inverse:
            return .white
        }
    }

    var textColor: UIColor {
        switch self {
        case .promo:
            return .textTagPromo
        case .active:
            return .textTagActive
        case .inactive:
            return .textTagInactive
        case .success:
            return .textTagSuccess
        case .warning:
            return .textTagWarning
        case .error:
            return .textTagError
        case .inverse:
            return .textTagActive
        }
    }
}
