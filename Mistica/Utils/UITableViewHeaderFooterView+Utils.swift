//
//  UITableViewHeaderFooterView+Utils.swift
//  Mistica
//
//  Created by dmarin on 07/09/2018.
//  Copyright © 2018 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

extension UITableViewHeaderFooterView {
	class func register(on tableView: UITableView) {
		tableView.register(self, forHeaderFooterViewReuseIdentifier: headerFooterReuseIdentifier())
	}

	class func registerNib(on tableView: UITableView) {
		tableView.register(nib(), forHeaderFooterViewReuseIdentifier: headerFooterReuseIdentifier())
	}

	class func dequeueReusableHeaderFooterView(from tableView: UITableView) -> Self {
		internalDequeueReusableHeaderFooterView(from: tableView, identifier: headerFooterReuseIdentifier())
	}
}

private extension UITableViewHeaderFooterView {
	class func headerFooterReuseIdentifier() -> String {
		NSStringFromClass(self).components(separatedBy: ".").last!
	}

	class func internalDequeueReusableHeaderFooterView<T>(from tableView: UITableView, identifier: String) -> T where T: UITableViewHeaderFooterView {
		guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
			fatalError("Nib cell class does not match expected cell class \(identifier).")
		}

		return cell
	}
}
