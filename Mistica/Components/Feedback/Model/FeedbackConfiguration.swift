//
//  FeedbackConfiguration.swift
//  Mistica
//
//  Created by pbartolome on 25/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public struct FeedbackConfiguration {
    let style: FeedbackStyle
    let title: String
    let subtitle: String?
    let primaryAction: FeedbackPrimaryAction
    let secondaryAction: FeedbackSecondaryAction
    let extraContent: UIView?
    let shouldHideCloseButton: Bool
    let modalPresentationStyle: UIModalPresentationStyle?
    public let screenName: UInt?

    public init(style: FeedbackStyle,
                title: String,
                subtitle: String?,
                primaryAction: FeedbackPrimaryAction,
                secondaryAction: FeedbackSecondaryAction = .none,
                extraContent: UIView? = nil,
                shouldHideCloseButton: Bool = false,
                modalPresentationStyle: UIModalPresentationStyle? = nil,
                screenName: UInt? = nil) {
        self.style = style
        self.title = title
        self.subtitle = subtitle
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        self.extraContent = extraContent
        self.shouldHideCloseButton = shouldHideCloseButton
        self.modalPresentationStyle = modalPresentationStyle
        self.screenName = screenName
    }
}
