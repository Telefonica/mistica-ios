//
//  LoadErrorViewControllerDelegate.swift
//  Mistica
//
//  Created by cbarrera on 19/11/2018.
//  Copyright © 2018 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public protocol LoadErrorViewControllerDelegate: AnyObject {
	func loadErrorViewControllerDidTapRetry(_ viewController: LoadErrorViewController)
}
