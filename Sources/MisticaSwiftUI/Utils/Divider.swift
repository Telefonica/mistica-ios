//
//  Divider.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaCommon
import SwiftUI

@available(iOS 13.0, *)
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
