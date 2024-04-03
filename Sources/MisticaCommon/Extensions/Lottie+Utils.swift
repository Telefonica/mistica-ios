//
//  Lottie+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Lottie

/**
  This extension is a fix has been necessary because the animations in  snapshot tests were being cut off without rendering correctly and as a consequence many tests were failing. This is due to a bug that exists in        CoreAnimation rendering engine when rendering in snapshots without mainThread mode, you can see more information here:
  https://github.com/airbnb/lottie-ios/discussions/1769#discussioncomment-3860672
 **/

public extension Lottie.LottieConfiguration {
    static var current: LottieConfiguration = {
        var configuration: LottieConfiguration = .init(renderingEngine: .automatic)
        #if DEBUG
            if isRunningUnitTests {
                configuration = .init(renderingEngine: .mainThread)
            }
        #endif
        return configuration
    }()
}
