//
//  Divider.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct Divider: View {
    private let color: Color

    public init(color: Color = .divider) {
        self.color = color
    }

    public var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: 1)
    }
}
