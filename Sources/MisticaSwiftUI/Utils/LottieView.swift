//
//  LottieView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Lottie

import SwiftUI
import UIKit

struct LottieView: UIViewRepresentable {
    var loopMode: LottieLoopMode = .loop
    var asset: NSDataAsset?
    var color: UIColor?
    var borderWidth: CGFloat?
    var scaleToFit = false
    var delay: Double = .zero

    mutating func setDelay(_ delay: Double) -> Self {
        self.delay = delay
        return self
    }

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> LottieAnimationView {
        let animationView = LottieAnimationView()
        animationView.animation = asset.lottieAnimation
        updateUIView(animationView, context: context)
        return animationView
    }

    func updateUIView(_ animationView: LottieAnimationView, context: Context) {
        if let color = color {
            let colorKeypath = AnimationKeypath(keypath: "**.Color")
            let colorProvider = ColorValueProvider(color.lottieColorValue)
            animationView.setValueProvider(colorProvider, keypath: colorKeypath)
        }

        if let borderWidth = borderWidth {
            let widthKeypath = AnimationKeypath(keypath: "**.Stroke Width")
            let widthProvider = FloatValueProvider(borderWidth)
            animationView.setValueProvider(widthProvider, keypath: widthKeypath)
        }

        if scaleToFit {
            animationView.clipsToBounds = false
            animationView.heightAnchor.constraint(equalTo: animationView.widthAnchor).isActive = true
            animationView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            animationView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        }

        if UIView.areAnimationsEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak animationView] in
                animationView?.play()
            }
        } else {
            animationView.currentProgress = 1
            animationView.forceDisplayUpdate()
            animationView.layoutIfNeeded()
        }
    }
}
