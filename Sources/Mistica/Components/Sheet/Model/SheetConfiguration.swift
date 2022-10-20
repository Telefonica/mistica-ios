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

    public init(
        header: SheetHeader,
        content: [SheetList]
    ) {
        self.header = header
        self.content = content
    }
}

public struct SheetHeader {
    public let title: String?
    public let subtitle: String?
    public let description: String?

    public init(
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
}

public struct SheetList {
    public let id: String
    public let listType: SheetListType
    public let autoSubmit: Bool
    public let selectedId: [String]

    public init(
        id: String,
        listType: SheetListType,
        autoSubmit: Bool,
        selectedId: [String]
    ) {
        self.id = id
        self.listType = listType
        self.autoSubmit = autoSubmit
        self.selectedId = selectedId
    }
}

public enum SheetListType {
    case singleSelection(items: [SingleSelectionItem])
    case actions(items: [ActionItem])
    case informative(items: [InformativeItem])

    var isInformative: Bool {
        switch self {
        case .informative:
            return true
        case .singleSelection:
            return false
        case .actions:
            return false
        }
    }
}

public struct SingleSelectionItem {
    public let id: String
    public let title: String?
    public let description: String?
    public let icon: SingleSelectionItemIcon?

    public init(
        id: String,
        title: String? = nil,
        description: String? = nil,
        icon: SingleSelectionItemIcon? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
    }
}

public struct SingleSelectionItemIcon {
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

    public init(
        url: String,
        urlDark: String? = nil,
        size: Size = .large
    ) {
        self.url = url
        self.urlDark = urlDark
        self.size = size
    }
}

public struct InformativeItem {
    public let id: String
    public let title: String
    public let description: String?
    public let icon: InformativeItemIcon

    public init(
        id: String,
        title: String,
        description: String?,
        icon: InformativeItemIcon
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
    }
}

public enum InformativeItemIcon {
    case regular(url: String, urlDark: String?)
    case small(url: String, urlDark: String?)
    case bullet

    var size: CGSize {
        switch self {
        case .bullet:
            return .init(width: 8, height: 8)
        case .small:
            return .init(width: 12, height: 24)
        case .regular:
            return .init(width: 20, height: 24)
        }
    }
}

public struct ActionItem {
    public enum Style {
        case normal
        case destructive
    }

    public let id: String
    public let title: String
    public let style: Style
    public let url: String?
    public let urlDark: String?

    public init(
        id: String,
        title: String,
        style: ActionItem.Style,
        url: String?,
        urlDark: String?
    ) {
        self.id = id
        self.title = title
        self.style = style
        self.url = url
        self.urlDark = urlDark
    }
}
