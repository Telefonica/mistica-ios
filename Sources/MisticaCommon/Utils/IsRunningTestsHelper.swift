//
//  IsRunningTestsHelper.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

#if DEBUG
    var isRunningUnitTests: Bool {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
            return false
        }

        return true
    }
#endif
