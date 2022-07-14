//
//  SizeViewModifier.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

@available(iOS 13.0, *)
struct SizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }

    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

@available(iOS 13.0, *)
public extension View {
    func onSizeChange(_ callback: @escaping (CGSize) -> Void) -> some View {
        modifier(SizeModifier())
            .onPreferenceChange(SizePreferenceKey.self, perform: callback)
    }

    func onWidthChange(_ callback: @escaping (CGFloat) -> Void) -> some View {
        onSizeChange { callback($0.width) }
    }

    func onHeightChange(_ callback: @escaping (CGFloat) -> Void) -> some View {
        onSizeChange { callback($0.height) }
    }
}
