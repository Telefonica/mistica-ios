import Combine
import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func onReceive<T>(_ publisher: T?, perform: @escaping (T.Output) -> Void) -> some View where T: Publisher, T.Failure == Never {
        modifier(OptionalPublisherReceiver(publisher: publisher, perform: perform))
    }
}

@available(iOS 13.0, *)
struct OptionalPublisherReceiver<T>: ViewModifier where T: Publisher, T.Failure == Never {
    let publisher: T?
    let perform: (T.Output) -> Void

    func body(content: Content) -> some View {
        if let publisher = publisher {
            content.onReceive(publisher, perform: perform)
        } else {
            content
        }
    }
}
