//
//  Badge.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
import SwiftUI

private enum Constants {
    static let maximumValue = 9
    static let flagBadgeSize: CGFloat = 8
    static let numericBadgeSize: CGFloat = 20
    static let numericBadgeLargeSize: CGFloat = 28
    static let horizontalInset: CGFloat = 2
}

@available(iOS 13.0, *)
public struct Badge: View {
    public enum Style {
        case numeric(Int)
        case flag
    }

    private let style: Style

    public init(style: Style) {
        self.style = style
    }

    public var body: some View {
        switch style {
        case .numeric(let number):
            numericView(number)

        case .flag:
            Circle()
                .fill(Color.badge)
                .frame(width: Constants.flagBadgeSize, height: Constants.flagBadgeSize)
        }
    }

    @ViewBuilder
    private func numericView(_ number: Int) -> some View {
        ZStack {
            if number > Constants.maximumValue {
                Capsule().fill(Color.badge)
                label("+\(Constants.maximumValue)")
            } else {
                Circle().fill(Color.badge)
                label("\(number)")
            }
        }
        .frame(
            width: number > Constants.maximumValue ? Constants.numericBadgeLargeSize : Constants.numericBadgeSize,
            height: Constants.numericBadgeSize
        )
    }

    @ViewBuilder
    private func label(_ text: String) -> some View {
        Text(text)
            .font(.textPreset1(weight: .medium, constrainedToPreferredSize: .accessibilityMedium))
            .foregroundColor(.textPrimaryInverse)
    }
}

#if DEBUG

    @available(iOS 13.0, *)
    struct Badge_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                VStack {
                    HStack {
                        ForEach(0 ..< 11) { _ in
                            Badge(style: .flag)
                        }
                    }

                    HStack {
                        ForEach(0 ..< 11) {
                            Badge(style: .numeric($0))
                        }
                    }
                }
            }
        }
    }
#endif
