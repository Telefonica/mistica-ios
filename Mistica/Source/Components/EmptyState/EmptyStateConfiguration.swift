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
    static let empty = EmptyStateConfiguration(asset: .icon(image: UIImage(color: .success), card: false), title: "Basic configuration", description: "This is a basic configuration for the empty state", actions: nil)

    public enum EmptyStateActions {
        case primary(EmptyStateButton)
        case primaryAndLink(primary: EmptyStateButton, link: EmptyStateLinkButton)
        case secondary(EmptyStateButton)
        case secondaryAndLink(secondary: EmptyStateButton, link: EmptyStateLinkButton)
        case empty
    }

    @frozen
    public enum EmptyStateAssetType: Equatable {
        case icon(image: UIImage, card: Bool)
        case smallImage(image: UIImage, card: Bool)
        case fullWidthImage(UIImage)
    }

    let asset: EmptyStateAssetType
    let title: String
    let description: String?
    let actions: EmptyStateActions?

    public init(asset: EmptyStateAssetType = .icon(image: UIImage(), card: false), title: String, description: String?, actions: EmptyStateActions? = nil) {
        self.asset = asset
        self.title = title
        self.description = description
        self.actions = actions
    }

    func isInCard() -> Bool {
        switch asset {
        case let .icon(_, isCard),
             let .smallImage(_, isCard):
            return isCard
        default: return false
        }
    }
}
