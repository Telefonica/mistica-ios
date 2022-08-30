//
//  PopoverConfiguration.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public struct PopoverConfiguration {
    public let tipDirection: PopoverView.TipDirection
    public let title: String?
    public let subtitle: String?
    public let image: UIImage?
    public let canClose: Bool

    public init(tipDirection: PopoverView.TipDirection, image: UIImage?,
                title: String?,
                subtitle: String?,
                canClose: Bool) {
        self.tipDirection = tipDirection
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.canClose = canClose
    }
}
