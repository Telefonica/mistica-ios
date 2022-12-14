//
//  View+ReceiveTimer.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Combine
import SwiftUI

typealias TimePublisher = Publishers.Autoconnect<Timer.TimerPublisher>

extension View {
    func onReceive(timer: TimePublisher?, perform action: @escaping (Timer.TimerPublisher.Output) -> Void) -> some View {
        Group {
            if let timer = timer {
                self.onReceive(timer, perform: { value in
                    action(value)
                })
            } else {
                self
            }
        }
    }
}
