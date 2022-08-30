//
//  LoadErrorViewControllerDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public protocol LoadErrorViewControllerDelegate: AnyObject {
    func loadErrorViewControllerDidTapRetry(_ viewController: LoadErrorViewController)
}
