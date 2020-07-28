//
//  LoadErrorViewControllerLifecycleDelegate.swift
//  Mistica
//
//  Created by mbarrios on 12/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public protocol LoadErrorViewControllerLifecycleDelegate: AnyObject {
    func loadErrorViewControllerDidAppear(_ viewController: LoadErrorViewController)
}
