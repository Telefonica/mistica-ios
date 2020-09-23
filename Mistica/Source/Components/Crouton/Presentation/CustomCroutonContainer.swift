//
//  CustomCroutonContainer.swift
//  Mistica
//
//  Created by Víctor Pimentel on 16/11/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

// Protocol implemented by view controllers that want to show croutons in a very specific view
@objc public protocol CustomCroutonContainer {
    var customCroutonContainerView: UIView { get }
}
