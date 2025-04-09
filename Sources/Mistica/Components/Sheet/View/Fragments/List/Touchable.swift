//
//  Touchable.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

@MainActor
protocol Touchable {
    func touchBegan()
    func touchEnded()
}
