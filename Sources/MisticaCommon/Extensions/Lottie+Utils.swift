//
//  Lottie+Utils.swift
//
//
//  Created by Alejandro Ruiz on 2/4/24.
//

import Lottie
import Foundation

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
