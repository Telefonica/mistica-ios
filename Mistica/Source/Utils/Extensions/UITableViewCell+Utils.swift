//
//  UITableViewCell+Utils.swift
//  Mistica
//
//  Created by Víctor Pimentel on 09/01/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class func register(on tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: cellReuseIdentifier())
    }

    class func registerNib(on tableView: UITableView) {
        tableView.register(nib(), forCellReuseIdentifier: cellReuseIdentifier())
    }

    class func registerNib(on tableView: UITableView, with customIdentifier: String) {
        tableView.register(nib(), forCellReuseIdentifier: customIdentifier)
    }

    class func dequeueReusableCell(for indexPath: IndexPath, from tableView: UITableView) -> Self {
        internalDequeueReusableCell(for: indexPath, from: tableView, identifier: cellReuseIdentifier())
    }

    class func dequeueReusableCell(for indexPath: IndexPath, from tableView: UITableView, with customIdentifier: String) -> Self {
        internalDequeueReusableCell(for: indexPath, from: tableView, identifier: customIdentifier)
    }
}

private extension UITableViewCell {
    class func cellReuseIdentifier() -> String {
        NSStringFromClass(self).components(separatedBy: ".").last!
    }

    class func internalDequeueReusableCell<T>(for indexPath: IndexPath, from tableView: UITableView, identifier: String) -> T where T: UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Nib cell class does not match expected cell class \(identifier).")
        }

        return cell
    }
}
