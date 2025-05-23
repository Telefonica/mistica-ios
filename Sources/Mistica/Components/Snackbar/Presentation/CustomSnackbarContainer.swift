//
//  CustomSnackbarContainer.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

// Protocol implemented by view controllers that want to Snackbar in a very specific view
@objc public protocol CustomSnackbarContainer {
    @MainActor var customSnackbarContainerView: UIView { get }
}
