//
//  BrandStyle+UIStatusBarStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public extension BrandStyle {
    var preferredStatusBarStyle: UIStatusBarStyle {
        switch self {
        case .movistar, .o2New, .blau, .custom, .vivoNew, .tu, .telefonica:
            return .lightContent
        }
    }
}
