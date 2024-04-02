//
//  Lottie+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Lottie

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
