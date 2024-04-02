//
//  IsRunningUnitTests.swift
//
//
//  Created by Alejandro Ruiz on 2/4/24.
//

import Foundation

#if DEBUG
    public var isRunningUnitTests: Bool {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
            return false
        }

        return true
    }
#endif
