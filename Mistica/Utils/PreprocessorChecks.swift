//
//  PreprocessorChecks.swift
//  Messenger
//
//  Created by asantos on 23/09/15.
//  Copyright © 2015 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

// Assert for checking that the current code is being run in the main queue
public func assertMainThread() {
	assert(Thread.isMainThread, "Not in main queue!")
}
