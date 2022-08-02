//
//  PaginatedCarousel.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Combine
import Foundation

import SwiftUI

@available(iOS 13.0, *)
struct PaginatedCarousel<Element, Content: View>: View {
    @Binding var index: Int
    private var itemWidth: CGFloat
    private var spacing: CGFloat
    private var elements: [Element]
    private var content: Content

    @State private var contentOffset: CGPoint = .zero
    @State private var isGestureActive = false

    init(
        index: Binding<Int>,
        itemWidth: CGFloat,
        spacing: CGFloat,
        elements: [Element],
        @ViewBuilder content: () -> Content
    ) {
        _index = index
        self.itemWidth = itemWidth
        self.spacing = spacing
        self.elements = elements
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                content
            }
            .content
            .offset(x: xOffset())
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(dragGesture(geometry: geometry))
            .animation(.misticaTimingCurve, value: contentOffset)
            .animation(.misticaTimingCurve, value: index)
        }
    }
}

@available(iOS 13.0, *)
private extension PaginatedCarousel {
    var actualItemWidth: CGFloat {
        itemWidth + spacing
    }

    func xOffset() -> CGFloat {
        isGestureActive ? contentOffset.x : xOffset(at: index)
    }

    func xOffset(at index: Int) -> CGFloat {
        -actualItemWidth * CGFloat(index)
    }

    func dragGesture(geometry: GeometryProxy) -> some Gesture {
        DragGesture()
            .onChanged { value in
                isGestureActive = true
                contentOffset.x = value.translation.width + xOffset(at: index)
            }
            .onEnded { value in
                // Adjust index based on the final position of the gesture.
                // If we are in the right side of the screen, increment the index.
                if -value.predictedEndTranslation.width > geometry.size.width / 2, index < elements.endIndex - 1 {
                    index += 1
                }
                // If we are in the left side of the screen, decrement the index.
                if value.predictedEndTranslation.width > geometry.size.width / 2, index > 0 {
                    index -= 1
                }
                contentOffset.x = xOffset(at: index)
                isGestureActive = false
            }
    }
}
