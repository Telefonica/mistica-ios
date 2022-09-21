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
    let header: SheetHeader
    let content: [SheetList]

    public init(header: SheetHeader,
                content: [SheetList]) {
        self.header = header
        self.content = content
    }
}

public struct SheetHeader {
    let title: String?
    let subtitle: String?
    let description: String?

    public init(title: String? = nil,
                subtitle: String? = nil,
                description: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
}

public struct SheetList {
    let id: String
    let type: String
    let listType: String?
    let autoSubmit: Bool?
    let selectedId: String?
    let items: [SheetListRow]

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
    let id: String
    let title: String?
    let description: String?
    let icon: SheetListRowIcon?
    let isSelected: Bool

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
    let url: String
    let urlDark: String?

    public init(url: String,
                urlDark: String? = nil) {
        self.url = url
        self.urlDark = urlDark
    }
}
