//
//  FeedbackStyle+Toolkit.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Lottie

import UIKit

@frozen
public enum FeedbackStyle: Equatable, Sendable {
    case success
    case informative
    case error
    case feedback(icon: UIImage)
}

enum FeedbackIconStyle {
    case none
    case asset(UIImage)
    case animation(Lottie.LottieAnimation)
}

extension FeedbackStyle {
    var shouldUseInverseFeedbacks: Bool {
        switch self {
        case .success:
            return true
        case .informative, .error, .feedback:
            return false
        }
    }

    var feedbackTextPrimary: UIColor {
        shouldUseInverseFeedbacks ? .textPrimaryInverse : .textPrimary
    }

    var feedbackTextSecondary: UIColor {
        shouldUseInverseFeedbacks ? .textPrimaryInverse : .textSecondary
    }

    var feedbackPrimary: Button.Style {
        shouldUseInverseFeedbacks ? .primaryInverse : .primary
    }

    var feedbackSecondary: Button.Style {
        shouldUseInverseFeedbacks ? .secondaryInverse : .secondary
    }

    var feedbackLink: Button.Style {
        shouldUseInverseFeedbacks ? .linkInverse : .link
    }

    var shouldAnimate: Bool {
        animation != nil
    }

    var iconStyle: FeedbackIconStyle {
        switch self {
        case .success, .error:
            guard let animation = animation else { return .none }
            return .animation(animation)
        case .informative:
            guard let iconNotificationInfo = UIImage.iconNotificationInfo?.withRenderingMode(.alwaysTemplate) else { return .none }
            return .asset(iconNotificationInfo)
        case .feedback(let icon):
            return .asset(icon)
        }
    }

    private var animation: Lottie.LottieAnimation? {
        switch self {
        case .success:
            return NSDataAsset.successAnimation.lottieAnimation
        case .error:
            return NSDataAsset.errorAnimation.lottieAnimation
        case .informative, .feedback:
            return nil
        }
    }

    var hapticFeedbackStyle: UINotificationFeedbackGenerator.FeedbackType? {
        switch self {
        case .success:
            return .success
        case .informative:
            return .warning
        case .error:
            return .error
        case .feedback:
            return nil
        }
    }

    var hapticFeedbackDelay: TimeInterval? {
        switch self {
        case .success:
            return 0.45
        case .informative:
            return 0
        case .error:
            return 0.5
        case .feedback:
            return nil
        }
    }
}
