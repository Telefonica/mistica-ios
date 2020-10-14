//
//  LoadErrorViewControllerLifecycleDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation

public protocol LoadErrorViewControllerLifecycleDelegate: AnyObject {
    func loadErrorViewControllerDidAppear(_ viewController: LoadErrorViewController)
}
