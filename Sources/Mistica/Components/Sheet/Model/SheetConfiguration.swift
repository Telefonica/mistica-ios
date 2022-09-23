//
//  SheetConfiguration.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public struct SheetConfiguration {
    public let header: SheetHeader
    public let content: [SheetList]

    public init(header: SheetHeader,
                content: [SheetList]) {
        self.header = header
        self.content = content
    }
}

public struct SheetHeader {
    public let title: String?
    public let subtitle: String?
    public let description: String?

    public init(title: String? = nil,
                subtitle: String? = nil,
                description: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
}

public struct SheetList {
    public let id: String
    public let type: String
    public let listType: String?
    public let autoSubmit: Bool?
    public let selectedId: String?
    public let items: [SheetListRow]

    public init(id: String,
                type: String,
                listType: String? = nil,
                autoSubmit: Bool? = nil,
                selectedId: String? = nil,
                items: [SheetListRow]) {
        self.id = id
        self.type = type
        self.listType = listType
        self.autoSubmit = autoSubmit
        self.selectedId = selectedId
        self.items = items
    }
}

public struct SheetListRow {
    public let id: String
    public let title: String?
    public let description: String?
    public let icon: SheetListRowIcon?
    public let isSelected: Bool

    public init(id: String,
                title: String? = nil,
                description: String? = nil,
                icon: SheetListRowIcon? = nil,
                isSelected: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
        self.isSelected = isSelected
    }
}

public struct SheetListRowIcon {
    public enum Size {
        case small
        case large

        var value: CGFloat {
            switch self {
            case .small:
                return 24
            case .large:
                return 40
            }
        }
    }

    public let url: String
    public let urlDark: String?
    public let size: Size

    public init(url: String,
                urlDark: String? = nil,
                size: Size = .large) {
        self.url = url
        self.urlDark = urlDark
        self.size = size
    }
}
