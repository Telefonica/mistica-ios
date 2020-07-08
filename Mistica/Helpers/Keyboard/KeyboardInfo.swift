//
//  KeyboardInfo.swift
//  Mistica
//
//  Created by Pablo Carcelén on 11/03/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public struct KeyboardInfo {
	public let duration: TimeInterval
	public let curve: UIView.AnimationCurve
	public let frameEnd: CGRect
	public let frameBegin: CGRect

	public var animationOptions: UIView.AnimationOptions {
		UIView.AnimationOptions(rawValue: UInt(curve.rawValue) << 16)
	}

	init(userInfo: [AnyHashable: Any]) {
		duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0
		let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int ?? 0
		curve = UIView.AnimationCurve(rawValue: curveValue) ?? .linear
		frameEnd = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
		frameBegin = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect ?? .zero
	}
}
