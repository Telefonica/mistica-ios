//
//  FeedbackConfiguration.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public typealias FeedbackCompletion = @Sendable () -> Void
public typealias FeedbackRetryCompletion = @MainActor(@escaping @Sendable() -> Void) -> Void

@frozen
public enum FeedbackPrimaryAction {
    case none
    case button(title: String, completion: FeedbackCompletion)
    case retryButton(title: String, loadingTitle: String?, retryCompletion: FeedbackRetryCompletion)
}

@frozen
public enum FeedbackSecondaryAction {
    case none
    case button(title: String, completion: FeedbackCompletion)
    case link(title: String, completion: FeedbackCompletion)
}

@frozen
public enum FeedbackNavigationButton: Equatable {
    // Remove the button from the navigation bar
    case none

    // Keep the existing navigation bar button
    case keep

    // Use a custom UIBarButtonItem
    case custom(button: UIBarButtonItem)
}

public struct FeedbackConfiguration: Equatable {
    public let style: FeedbackStyle
    public let title: String
    public let subtitle: String?
    public let errorReference: String?
    public let primaryAction: FeedbackPrimaryAction
    public let secondaryAction: FeedbackSecondaryAction
    public let extraContent: UIView?
    public let closeButton: FeedbackNavigationButton
    public let backButton: FeedbackNavigationButton
    public let shouldDisableSwipeToDismiss: Bool
    public let modalPresentationStyle: UIModalPresentationStyle?

    public init(style: FeedbackStyle,
                title: String,
                subtitle: String?,
                errorReference: String?,
                primaryAction: FeedbackPrimaryAction,
                secondaryAction: FeedbackSecondaryAction = .none,
                extraContent: UIView? = nil,
                closeButton: FeedbackNavigationButton = .keep,
                backButton: FeedbackNavigationButton = .keep,
                shouldDisableSwipeToDismiss: Bool = false,
                modalPresentationStyle: UIModalPresentationStyle? = nil) {
        self.style = style
        self.title = title
        self.subtitle = subtitle
        self.errorReference = errorReference
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        self.extraContent = extraContent
        self.closeButton = closeButton
        self.backButton = backButton
        self.shouldDisableSwipeToDismiss = shouldDisableSwipeToDismiss
        self.modalPresentationStyle = modalPresentationStyle
    }
}

extension FeedbackPrimaryAction: Equatable {
    public static func == (lhs: FeedbackPrimaryAction, rhs: FeedbackPrimaryAction) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.button(let lhsTitle, _), .button(let rhsTitle, _)):
            return lhsTitle == rhsTitle
        case (.retryButton(let lhsTitle, let lhsLoadingTitle, _), .retryButton(let rhsTitle, let rhsLoadingTitle, _)):
            return lhsTitle == rhsTitle && lhsLoadingTitle == rhsLoadingTitle
        default:
            return false
        }
    }
}

extension FeedbackSecondaryAction: Equatable {
    public static func == (lhs: FeedbackSecondaryAction, rhs: FeedbackSecondaryAction) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.button(let lhsTitle, _), .button(let rhsTitle, _)):
            return lhsTitle == rhsTitle
        case (.link(let lhsTitle, _), .link(let rhsTitle, _)):
            return lhsTitle == rhsTitle
        default:
            return false
        }
    }
}
