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
        guard UIAccessibility.isVoiceOverRunning else { return }

        if #available(iOS 17.0, *) {
            var highPriorityAnnouncement = AttributedString(announcement)
            highPriorityAnnouncement.accessibilitySpeechAnnouncementPriority = .high
            AccessibilityNotification.Announcement(highPriorityAnnouncement).post()
        } else {
            let attributedMessage: NSAttributedString = NSAttributedString(
                string: announcement,
                attributes: [
                    .accessibilitySpeechQueueAnnouncement: true
                ]
            )

            UIAccessibility.post(notification: .announcement, argument: attributedMessage)
        }
    }
}
