//
//  AccessibilityHelper.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public struct AccessibilityHelper {
    public static func post(_ announcement: String) {
        let attributedMessage: NSAttributedString = NSAttributedString(
            string: announcement,
            attributes: [
                .accessibilitySpeechQueueAnnouncement: true
            ]
        )

        UIAccessibility.post(notification: .announcement, argument: attributedMessage)
    }
}
