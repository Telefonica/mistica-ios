//
//  KeyboardNotificationCenter.swift
//  Mistica
//
//  Created by Enrique de la Torre Fernandez on 5/25/16.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardInfo {
    func animateAlongsideKeyboard(animations: @escaping () -> Void) {
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: animationOptions,
                       animations: animations,
                       completion: nil)
    }
}

struct KeyboardEvent: Hashable {
    let notificationName: Notification.Name

    public static let willShow = KeyboardEvent(notificationName: UIResponder.keyboardWillShowNotification)
    public static let didShow = KeyboardEvent(notificationName: UIResponder.keyboardDidShowNotification)
    public static let willHide = KeyboardEvent(notificationName: UIResponder.keyboardWillHideNotification)
    public static let didHide = KeyboardEvent(notificationName: UIResponder.keyboardDidHideNotification)
}

class KeyboardNotificationCenter {
    public typealias KeyboardEventHandlerBlock = (_ info: KeyboardInfo) -> Void

    // MARK: Private properties

    private var handlers = [KeyboardEvent: KeyboardEventHandlerBlock]()
    private let notificationCenter = NotificationCenter.default

    public init() {}

    deinit {
        stopObserving()
    }
}

extension KeyboardNotificationCenter {
    /// Start observing the notification associated to the  keyboard event
    /// passed as parameter.
    ///
    /// Note this class only supports one handler per event. If you add a second handler
    /// to an event that already has a handler, the first handler will be replaced by the second one.
    ///
    /// - Parameters:
    ///   - event: Keyboard event that we need to observe.
    ///   - handler: Closure execute when the event happens.
    func subscribe(_ event: KeyboardEvent, handler: @escaping KeyboardEventHandlerBlock) {
        addObserverIfNeeded(for: event)
        handlers[event] = handler
    }
}

// MARK: Private Methods

private extension KeyboardNotificationCenter {
    func stopObserving() {
        removeAllObserversForKeyboard()
        handlers.removeAll()
    }

    func addObserverIfNeeded(for event: KeyboardEvent) {
        guard !handlers.keys.contains(event) else { return }
        notificationCenter.addObserver(self,
                                       selector: #selector(didReceiveKeyboardEvent),
                                       name: event.notificationName,
                                       object: nil)
    }

    func removeObserver(for event: KeyboardEvent) {
        notificationCenter.removeObserver(self, name: event.notificationName, object: nil)
    }

    func removeAllObserversForKeyboard() {
        handlers.keys.forEach {
            removeObserver(for: $0)
        }
    }

    func executeHandler(for event: KeyboardEvent, userInfo: [AnyHashable: Any]?) {
        guard let userInfo = userInfo,
            let handler = handlers[event] else {
            return
        }
        handler(KeyboardInfo(userInfo: userInfo))
    }

    @objc func didReceiveKeyboardEvent(_ notification: Notification) {
        let event = KeyboardEvent(notificationName: notification.name)
        executeHandler(for: event, userInfo: notification.userInfo)
    }
}
