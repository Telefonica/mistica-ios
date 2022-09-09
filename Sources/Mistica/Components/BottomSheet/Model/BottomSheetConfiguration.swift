//
//  BottomSheetConfiguration.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public struct BottomSheetConfiguration {
    public var header: BottomSheetHeader
    public var content: [BottomSheetList]

    public init(header: BottomSheetHeader,
                content: [BottomSheetList]) {
        self.header = header
        self.content = content
    }
}

public struct BottomSheetHeader {
    public var title: String?
    public var subtitle: String?
    public var description: String?

    public init(title: String? = nil,
                subtitle: String? = nil,
                description: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
}

public struct BottomSheetList {
    public var id: String
    public var type: String
    public var listType: String?
    public var autoSubmit: Bool?
    public var selectedId: String?
    public var items: [BottomSheetListRow]

    public init(id: String,
                type: String,
                listType: String? = nil,
                autoSubmit: Bool? = nil,
                selectedId: String? = nil,
                items: [BottomSheetListRow]) {
        self.id = id
        self.type = type
        self.listType = listType
        self.autoSubmit = autoSubmit
        self.selectedId = selectedId
        self.items = items
    }
}

public struct BottomSheetListRow {
    public var id: String
    public var title: String?
    public var description: String?
    public var icon: UIImage?
    public var isSelected: Bool

    public init(id: String,
                title: String? = nil,
                description: String? = nil,
                icon: UIImage? = nil,
                isSelected: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
        self.isSelected = isSelected
    }
}
