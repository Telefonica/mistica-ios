//
//  TabItem.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public struct TabItem: Equatable {
    public let title: String
    public let icon: UIImage?
    public let accessibilityIdentifier: String?
    
    public init(title: String, icon: UIImage?, accessibilityIdentifier: String? = nil) {
        self.title = title
        self.icon = icon
        self.accessibilityIdentifier = accessibilityIdentifier
    }
}
