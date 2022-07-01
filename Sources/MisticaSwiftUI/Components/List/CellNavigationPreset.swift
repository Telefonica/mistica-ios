import Foundation
import SwiftUI

private enum Constants {
    static let spacing: CGFloat = 16
    static let smallImageSize: CGFloat = 24
}

@available(iOS 13.0, *)
public struct CellNavigationPreset: View {
    private var badgeStyle: Badge.Style?

    public init(badgeStyle: Badge.Style? = nil) {
        self.badgeStyle = badgeStyle
    }

    public var body: some View {
        HStack(alignment: .center, spacing: Constants.spacing) {
            if let badgeStyle = badgeStyle {
                Badge(style: badgeStyle)
            }

            Image.arrowRight
                .renderingMode(.template)
                .foregroundColor(.neutralMedium)
                .frame(width: Constants.smallImageSize, height: Constants.smallImageSize, alignment: .center)
        }
    }
}
