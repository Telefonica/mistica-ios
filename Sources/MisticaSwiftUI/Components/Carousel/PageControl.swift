//
//  PageControl.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

private enum Constants {
    static let hiddenBulletDiameter: CGFloat = 2
    static let partiallyHiddenBulletDiameter: CGFloat = 3
    static let selectedBulletDiameter: CGFloat = 6
    static let bulletDiameter: CGFloat = 4
    static let bulletMargin: CGFloat = 8
    static let visibleItems: Int = 5
}

@available(iOS 14.0, *)
struct PageControl: View {
    @Binding var selectedItem: Int
    private let items: Int
    private var inverseStyle = false

    // Contains how much the view has been move based on bullets distance.
    // For example, a value of 1 means that the view containing the bullets
    // has been moved in the x axis the same size of the width of 1 bullet.
    @State var frameOffsetItem: Int = 0

    init(
        items: Int,
        selectedItem: Binding<Int>
    ) {
        self.items = items
        _selectedItem = selectedItem
    }

    var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: Constants.bulletMargin) {
                ForEach(0 ..< items, id: \.self) { index in
                    Circle()
                        .foregroundColor(foregroundColor(at: index))
                        .frame(width: Constants.bulletDiameter, height: Constants.bulletDiameter)
                        .scaleEffect(scaleEffect(at: index))
                        .animation(.misticaTimingCurve, value: selectedItem)
                }
            }
            .frame(width: width, alignment: .leading)
            .offset(x: -offset(at: frameOffsetItem))
            .animation(.misticaTimingCurve, value: frameOffsetItem)
            .onChange(of: selectedItem, perform: updateContentOffset)
        }
        .padding(2)
        .clipped()
    }
}

@available(iOS 14.0, *)
extension PageControl {
    func bulletsStyleInverse(_ inverse: Bool) -> PageControl {
        var control = self
        control.inverseStyle = inverse
        return control
    }
}

@available(iOS 14.0, *)
private extension PageControl {
    func updateContentOffset(with index: Int) {
        let relativeItem = selectedItem - frameOffsetItem

        if relativeItem > Constants.visibleItems {
            frameOffsetItem += 1
        }

        if relativeItem < 1 && selectedItem > 0 {
            frameOffsetItem -= 1
        }
    }

    func foregroundColor(at index: Int) -> Color {
        if inverseStyle {
            index == selectedItem ? .controlInverse : .controlInverse.opacity(0.5)
        } else {
            index == selectedItem ? .controlActivated : .control
        }
    }

    func scaleEffect(at index: Int) -> CGFloat {
        // To simplify distance calculations, all the bullets are the same size.
        // However, not all bullets should have the same size. In order to fix the problem I'm using scales.
        // This functions calculate the scale needed based on the default size of the bullet.
        func scaled(_ diameter: CGFloat) -> CGFloat {
            diameter / Constants.bulletDiameter
        }

        if index == selectedItem {
            return scaled(Constants.selectedBulletDiameter)
        }

        let relativeItem = index - frameOffsetItem
        let visibleItems = Constants.visibleItems

        switch relativeItem {
        case 0 where frameOffsetItem > 0:
            return scaled(Constants.hiddenBulletDiameter)
        case 1 where frameOffsetItem > 1:
            return scaled(Constants.partiallyHiddenBulletDiameter)

        case visibleItems where frameOffsetItem > visibleItems - 1:
            return scaled(Constants.hiddenBulletDiameter)
        case visibleItems - 1 where frameOffsetItem > visibleItems - 2:
            return scaled(Constants.partiallyHiddenBulletDiameter)

        default:
            return 1
        }
    }

    var width: CGFloat? {
        guard items > Constants.visibleItems else { return nil }
        return offset(at: Constants.visibleItems) + Constants.bulletMargin
    }

    var bulletRadius: CGFloat {
        Constants.bulletDiameter / 2
    }

    func offset(at index: Int) -> CGFloat {
        CGFloat(index) * (Constants.bulletMargin + Constants.bulletDiameter)
    }
}

#if DEBUG
    @available(iOS 14.0, *)
    struct PageControlWrapper: View {
        @State var index = 0
        @State var items = 3
        var inverse = false
        var body: some View {
            ZStack {
                Color(.secondarySystemBackground)
                VStack {
                    HStack(alignment: .center) {
                        Button("<") {
                            guard index > 0 else { return }
                            index -= 1
                        }
                        PageControl(items: items, selectedItem: $index)
                            .bulletsStyleInverse(inverse)
                        Button(">") {
                            guard index < items - 1 else { return }
                            index += 1
                        }
                    }
                }
            }
        }
    }

    @available(iOS 14.0, *)
    struct PageControl_Previews: PreviewProvider {
        static var previews: some View {
            PageControlWrapper()
                .previewDisplayName("Style normal")

            PageControlWrapper(inverse: true)
                .previewDisplayName("Style inverse")
        }
    }
#endif
