//
//  FeedbackStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

enum FeedbackIconStyle {
    case none
    case image(Image)
    case animation(LottieView)
}

public enum FeedbackStyle {
    case success
    case error(reference: String?)
    case informative
    case feedback(Image)

    @MainActor var primaryButtonStyle: MisticaButtonStyle {
        switch self {
        case .success:
            switch MisticaConfig.currentThemeVariants.successFeedback {
            case .default, .alternative:
                return .misticaPrimary()
            case .inverse:
                return .misticaPrimaryInverse()
            }
        case .informative, .error, .feedback:
            return .misticaPrimary()
        }
    }

    @MainActor var secondaryButtonStyle: MisticaButtonStyle {
        switch self {
        case .success:
            switch MisticaConfig.currentThemeVariants.successFeedback {
            case .default, .alternative:
                return .misticaSecondary()
            case .inverse:
                return .misticaSecondaryInverse()
            }
        case .informative, .error, .feedback:
            return .misticaSecondary()
        }
    }

    @MainActor var linkButtonStyle: MisticaButtonStyle {
        switch self {
        case .success:
            switch MisticaConfig.currentThemeVariants.successFeedback {
            case .default, .alternative:
                return .misticaLink()
            case .inverse:
                return .misticaLinkInverse()
            }
        case .informative, .error, .feedback:
            return .misticaLink()
        }
    }

    @MainActor var iconStyle: FeedbackIconStyle {
        switch self {
        case .success, .error:
            guard let dataAsset = dataAsset else { return .none }
            return .animation(LottieView(loopMode: .playOnce, asset: dataAsset, scaleToFit: true))
        case .informative:
            guard let image = image else { return .none }
            return .image(image)
        case .feedback(let image):
            return .image(image)
        }
    }

    private var dataAsset: NSDataAsset? {
        switch self {
        case .success:
            return .successAnimation
        case .error:
            return .errorAnimation
        case .informative, .feedback:
            return nil
        }
    }

    private var image: Image? {
        switch self {
        case .success, .error:
            return nil
        case .informative:
            return Image.iconNotificationInfo
        case .feedback(let image):
            return image
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

    var shouldAnimate: Bool {
        switch self {
        case .success, .error:
            return true
        case .informative, .feedback:
            return false
        }
    }
}
