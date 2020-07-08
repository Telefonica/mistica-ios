//
//  FeedbackStyle+Toolkit.swift
//  Mistica
//
//  Created by pbartolome on 21/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit
import Lottie

public enum FeedbackStyle {
	case success
	case informative
	case error
}

enum FeedbackIconStyle {
	case none
	case asset(UIImage)
	case animation(Lottie.Animation)
}

extension FeedbackStyle {
	var shouldUseInverseFeedbacks: Bool {
		switch self {
		case .success:
			return true
		case .informative, .error:
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
			guard let iconNotificationInfo = UIImage.iconNotificationInfo else { return .none }
			return .asset(iconNotificationInfo)
		}
	}

	private var animation: Lottie.Animation? {
		switch self {
		case .success:
			return NSDataAsset.successAnimation.lottieAnimation
		case .error:
			return NSDataAsset.errorAnimation.lottieAnimation
		case .informative:
			return nil
		}
	}

	var hapticFeedbackStyle: UINotificationFeedbackGenerator.FeedbackType {
		switch self {
		case .success:
			return .success
		case .informative:
			return .warning
		case .error:
			return .error
		}
	}

	var hapticFeedbackDelay: TimeInterval {
		switch self {
		case .success:
			return 0.45
		case .informative:
			return 0
		case .error:
			return 0.5
		}
	}
}

private extension Optional where Wrapped == NSDataAsset {
	var lottieAnimation: Lottie.Animation? {
		switch self {
		case .none:
			return nil
		case .some(let dataAsset):
			return try? JSONDecoder().decode(Lottie.Animation.self, from: dataAsset.data)
		}
	}
}
