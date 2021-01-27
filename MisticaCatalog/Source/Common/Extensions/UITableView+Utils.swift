//
//  UITableView+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public extension UITableView {
    func deselectRow(animated: Bool) {
        if let indexPath = indexPathForSelectedRow {
            deselectRow(at: indexPath, animated: animated)
        }
    }
}
