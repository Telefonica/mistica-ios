//
//  CalloutConfiguration.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public struct CalloutConfiguration {
    static let emptyConfiguration = CalloutConfiguration(asset: .none, title: nil, description: "Empty configuration", actions: nil, canClose: true)

    public enum CalloutActions {
        case primary(CalloutButton)
        case primaryAndLink(primary: CalloutButton, link: CalloutLinkButton)
        case primaryAndSecondary(primary: CalloutButton, secondary: CalloutButton)
        case secondary(CalloutButton)
        case secondaryAndLink(secondary: CalloutButton, link: CalloutLinkButton)
        case link(CalloutLinkButton)
        case empty
    }

    @frozen
    public enum CalloutAssetType: Equatable {
        case none
        case smallIcon(UIImage)
    }

    let asset: CalloutAssetType
    let title: String?
    let description: String
    let actions: CalloutActions?
    let canClose: Bool
    let inverse: Bool

    /// Callout Configuration to setup the component.
    /// - Parameters:
    ///   - asset: This enum has the values none and smallIcon to draw the icon if needed at the left of the title and description section
    ///   - title: Optional value that will be printed above the description label
    ///   - description: This value is mandatory and will be printed as the description title of the callout
    ///   - actions: To know which buttons we must have inside the callout
    ///   - canClose: If true we will have a close button in the top-right to close the callout with an animation
    ///   - inverse: If true we will have an inverse variant for background color
    public init(
        asset: CalloutAssetType = .none,
        title: String? = nil,
        description: String,
        actions: CalloutActions? = nil,
        canClose: Bool = false,
        inverse: Bool = false
    ) {
        self.asset = asset
        self.title = title
        self.description = description
        self.actions = actions
        self.canClose = canClose
        self.inverse = inverse
    }
}
