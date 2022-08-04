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

@available(iOS 13.0, *)
struct LottieView: UIViewRepresentable {
    var loopMode: LottieLoopMode = .loop
    var asset: NSDataAsset?
    var color: UIColor?
    var borderWidth: CGFloat?
    var scaleToFit = false

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> AnimationView {
        let animationView = AnimationView()
        animationView.animation = asset.lottieAnimation
        updateUIView(animationView, context: context)
        return animationView
    }

    func updateUIView(_ animationView: AnimationView, context: Context) {
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
            animationView.play()
        } else {
            animationView.currentProgress = 1
            animationView.forceDisplayUpdate()
            animationView.layoutIfNeeded()
        }
    }
}
