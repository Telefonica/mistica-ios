//
//  FeedbackNavigator.swift
//  Mistica
//
//  Created by pbartolome on 25/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public protocol FeedbackNavigator {
    func dismissFeedback()
    func popFeedback()
    func pushFeedback(configuration: FeedbackConfiguration)
    func presentFeedback(configuration: FeedbackConfiguration, completion: (() -> Void)?)
}

public extension FeedbackNavigator {
    func presentFeedback(configuration: FeedbackConfiguration) {
        presentFeedback(configuration: configuration, completion: nil)
    }
}
