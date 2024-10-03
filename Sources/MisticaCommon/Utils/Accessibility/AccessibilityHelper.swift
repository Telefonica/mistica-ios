//
//  AccessibilityHelper.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@preconcurrency import UIKit

public enum AccessibilityHelper {
    @MainActor
    public static func post(_ announcement: String) {
        guard UIAccessibility.isVoiceOverRunning else { return }

        if #available(iOS 17.0, *) {
            /// In iOS 17 announcements can be made using an AttributedString with the attribute "accessibilitySpeechAnnouncementPriority"
            /// This attribute can have several values (high, default, low) but the only one that is assured to be spoken is "high".
            /// Due to several views when requesting focus will interrupt any announcement, all announcements are made using high priority
            var announcement = AttributedString(announcement)
            announcement.accessibilitySpeechAnnouncementPriority = .high
            AccessibilityNotification.Announcement(announcement).post()
        } else {
            /// In iOS 16 and lower announcements can be made using an NSAttributedString with the attribute "accessibilitySpeechQueueAnnouncement"
            /// This attribute is a boolean: If true it will be enqueued if another announcement is being made and if false it will be announced immediatly
            /// However this priority system only applies to this announcements, any other spoken message read by the OS (e.g: when an element request focus) will interrupt or cancel this announcement
            let attributedMessage = NSAttributedString(
                string: announcement,
                attributes: [
                    .accessibilitySpeechQueueAnnouncement: false
                ]
            )

            UIAccessibility.post(notification: .announcement, argument: attributedMessage)
        }
    }
}
