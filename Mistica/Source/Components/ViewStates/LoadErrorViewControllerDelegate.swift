//
//  LoadErrorViewControllerDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation

public protocol LoadErrorViewControllerDelegate: AnyObject {
    func loadErrorViewControllerDidTapRetry(_ viewController: LoadErrorViewController)
}
