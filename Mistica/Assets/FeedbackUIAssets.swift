//
//  FeedbackUIAssets.swift
//  Mistica
//
//  Created by pbartolome on 21/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static var iconNotificationInfo: UIImage? {
        UIImage(named: "icnNotificationInfo", type: .brandedAndThemed)
    }
}

extension NSDataAsset {
    static var successAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackSuccess", type: .branded)
    }

    static var errorAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackError", type: .branded)
    }
}
