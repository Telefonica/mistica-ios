//
//  BarButtonProvider.swift
//  Mistica
//
//  Created by Pablo on 21/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol BackBarButtonResponder: AnyObject {
	func didTapBackButton(_ sender: UIBarButtonItem)
}

@objc public protocol CloseBarButtonResponder: AnyObject {
	func didTapCloseButton(_ sender: UIBarButtonItem)
}

@objc public protocol RefreshBarButtonResponder: AnyObject {
	func didTapRefreshButton(_ sender: UIBarButtonItem)
}

@objc public protocol BarButtonProvider: AnyObject {
	func profileBarButtonItem() -> ProfileBarButtonItem
	func backBarButtonItem(responder: BackBarButtonResponder) -> BackBarButtonItem
	func closeBarButtonItem(responder: CloseBarButtonResponder) -> CloseBarButtonItem
	func cancelBarButtonItem(responder: CloseBarButtonResponder) -> CloseBarButtonItem
	func refreshBarButtonItem(responder: RefreshBarButtonResponder) -> RefreshBarButtonItem
}

public class DummyBarButtonProvider: BarButtonProvider {
	public init() {}

	public func profileBarButtonItem() -> ProfileBarButtonItem {
		fatalError()
	}

	public func backBarButtonItem(responder: BackBarButtonResponder) -> BackBarButtonItem {
		fatalError()
	}

	public func closeBarButtonItem(responder: CloseBarButtonResponder) -> CloseBarButtonItem {
		fatalError()
	}

	public func cancelBarButtonItem(responder: CloseBarButtonResponder) -> CloseBarButtonItem {
		fatalError()
	}

	public func refreshBarButtonItem(responder: RefreshBarButtonResponder) -> RefreshBarButtonItem {
		fatalError()
	}
}
