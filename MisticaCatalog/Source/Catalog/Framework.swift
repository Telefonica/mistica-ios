//
//  Framework.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

enum Framework {
    case swiftUI
    case uiKit

    var name: String {
        switch self {
        case .swiftUI:
            return "SwiftUI"
        case .uiKit:
            return "UIKit"
        }
    }

    func next() -> Self {
        switch self {
        case .swiftUI:
            return .uiKit
        case .uiKit:
            return .swiftUI
        }
    }

    mutating func toggle() {
        switch self {
        case .swiftUI:
            self = .uiKit
        case .uiKit:
            self = .swiftUI
        }
    }
}
