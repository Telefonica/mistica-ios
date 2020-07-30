//
//  FeedbackConfiguration.swift
//  Mistica
//
//  Created by pbartolome on 25/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public struct FeedbackConfiguration: Equatable {
    public let style: FeedbackStyle
    public let title: String
    public let subtitle: String?
    public let primaryAction: FeedbackPrimaryAction
    public let secondaryAction: FeedbackSecondaryAction
    public let extraContent: UIView?
    public let shouldHideCloseButton: Bool
    public let modalPresentationStyle: UIModalPresentationStyle?

    public init(style: FeedbackStyle,
                title: String,
                subtitle: String?,
                primaryAction: FeedbackPrimaryAction,
                secondaryAction: FeedbackSecondaryAction = .none,
                extraContent: UIView? = nil,
                shouldHideCloseButton: Bool = false,
                modalPresentationStyle: UIModalPresentationStyle? = nil) {
        self.style = style
        self.title = title
        self.subtitle = subtitle
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        self.extraContent = extraContent
        self.shouldHideCloseButton = shouldHideCloseButton
        self.modalPresentationStyle = modalPresentationStyle
    }
}
