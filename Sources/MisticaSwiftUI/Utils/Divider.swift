import Foundation
import SwiftUI
import Shared

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
