//
//  EmptyStateConfiguration.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public struct EmptyStateConfiguration {
    static let empty = EmptyStateConfiguration(type: .default(.icon(UIImage())), title: "Basic configuration", description: "This is a basic configuration for the empty state", actions: nil)

    public enum EmptyStateActions {
        case primary(EmptyStateButton)
        case primaryAndLink(primary: EmptyStateButton, link: EmptyStateLinkButton)
        case secondary(EmptyStateButton)
        case secondaryAndLink(secondary: EmptyStateButton, link: EmptyStateLinkButton)
        case link(EmptyStateLinkButton)
        case empty
    }

    @frozen
    public enum EmptyStateCardAsset: Equatable {
        case icon(UIImage)
    }

    @frozen
    public enum EmptyStateDefaultAsset: Equatable {
        case icon(UIImage)
        case smallImage(UIImage)
        case fullWidthImage(UIImage)
    }

    public enum EmptyStateType {
        case card(EmptyStateCardAsset)
        case `default`(EmptyStateDefaultAsset)
    }

    let type: EmptyStateType
    let title: String
    let description: String?
    let actions: EmptyStateActions?

    public init(type: EmptyStateType,
                title: String,
                description: String?,
                actions: EmptyStateActions? = nil) {
        self.type = type
        self.title = title
        self.description = description
        self.actions = actions
    }

    func isInCard() -> Bool {
        switch type {
        case .card:
            return true
        default:
            return false
        }
    }
}
