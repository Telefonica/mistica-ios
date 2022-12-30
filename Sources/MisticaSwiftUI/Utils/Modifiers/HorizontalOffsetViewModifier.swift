//
//  HorizontalOffsetViewModifier.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
    func horizontal(offset x: CGFloat?) -> some View {
        modifier(HorizontalOffsetModifier(x: x))
    }
}

struct HorizontalOffsetModifier: ViewModifier {
    let x: CGFloat?

    func body(content: Content) -> some View {
        if let x = x {
            content.offset(x: x)
        } else {
            content
        }
    }
}
