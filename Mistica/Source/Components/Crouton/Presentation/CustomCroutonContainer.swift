//
//  CustomCroutonContainer.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

// Protocol implemented by view controllers that want to show croutons in a very specific view
@objc public protocol CustomCroutonContainer {
    var customCroutonContainerView: UIView { get }
}
