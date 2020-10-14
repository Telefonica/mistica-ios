//
//  PreprocessorChecks.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation

// Assert for checking that the current code is being run in the main queue
func assertMainThread() {
    assert(Thread.isMainThread, "Not in main queue!")
}
