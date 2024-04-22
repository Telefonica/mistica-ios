//
//  View+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Combine
import SwiftUI
import MisticaCommon

public extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .hidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .hidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func hidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }

    @ViewBuilder func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }

    typealias ContentTransform<Content: View> = (Self) -> Content
    @ViewBuilder func conditionalModifier<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        then: ContentTransform<TrueContent>,
        else: ContentTransform<FalseContent>
    ) -> some View {
        if condition {
            then(self)
        } else {
            `else`(self)
        }
    }

    func expand(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }

    func expandHorizontally(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }

    func expandVertically(alignment: Alignment = .center) -> some View {
        frame(maxHeight: .infinity, alignment: alignment)
    }

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

    func applying<V: View>(@ViewBuilder _ builder: @escaping (Self) -> V) -> some View {
        builder(self)
    }

    func executing(_ work: () -> Void) -> some View {
        work()

        return background(Color.clear)
    }

    func executingAsync(_ work: @escaping () -> Void) -> some View {
        executing {
            DispatchQueue.main.async {
                work()
            }
        }
    }

    func executingWithGeometrySize(_ work: @escaping (CGSize) -> Void) -> some View {
        background(GeometryReader { proxy in
            executing {
                work(proxy.size)
            }
        })
    }

    func executingWithGeometrySizeAsync(_ work: @escaping (CGSize) -> Void) -> some View {
        executingWithGeometrySize { size in
            DispatchQueue.main.async {
                work(size)
            }
        }
    }

    /// A backwards compatible wrapper for iOS 14 `onChange`
    @ViewBuilder func valueChanged<T: Equatable>(value: T, onChange: @escaping (T) -> Void) -> some View {
        if #available(iOS 14.0, *) {
            self.onChange(of: value, perform: onChange)
        } else {
            onReceive(Just(value), perform: onChange)
        }
    }

    @available(iOSApplicationExtension, unavailable)
    func endEditingOnTap() -> some View {
        onTapGesture {
            UIApplication.shared
                .windows
                .filter(\.isKeyWindow)
                .first?
                .endEditing(true)
        }
    }

    func onSimultaneousTap(action: @escaping () -> Void) -> some View {
        simultaneousGesture(TapGesture().onEnded {
            action()
        })
    }
    
    func misticaColorStyle(_ colorStyle: MisticaColorStyle) -> some View {
        switch colorStyle {
        case .color(let color):
            return AnyView(Color(color))
        case .gradient(let gradient):
            return AnyView(GradientView(colors: gradient.colors, stops: gradient.stops, angle: gradient.angle))
        }
    }
}
