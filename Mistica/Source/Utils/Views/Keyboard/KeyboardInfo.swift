//
//  KeyboardInfo.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

struct KeyboardInfo {
    public let duration: TimeInterval
    public let curve: UIView.AnimationCurve
    public let frameEnd: CGRect
    public let frameBegin: CGRect

    var animationOptions: UIView.AnimationOptions {
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
