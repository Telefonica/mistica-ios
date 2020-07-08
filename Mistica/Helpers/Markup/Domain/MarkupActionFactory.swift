//
//  MarkupActionFactory.swift
//  Tuenti
//
//  Created by Victor Pimentel Rodriguez on 26/01/2018.
//  Copyright © 2018 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

@objc public protocol MarkupActionFactory {
	func action(withURL url: URL) -> MarkupAction
	func action(withPhoneNumber phoneNumber: String) -> MarkupAction
}
