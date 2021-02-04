//
//  TabItem.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct TabItem {
    public let title: String
    public let icon: String?
    
    public init(title: String, icon: String?) {
        self.title = title
        self.icon = icon
    }
}
