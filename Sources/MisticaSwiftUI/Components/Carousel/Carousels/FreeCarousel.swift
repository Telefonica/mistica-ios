//
//  FreeCarousel.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Combine
import Foundation

import SwiftUI

@available(iOS 14.0, *)
struct FreeCarousel<Element: Hashable, Content: View>: View {
    @Binding var index: Int
    private var elements: [Element]
    private var content: Content

    @State private var contentOffset: CGPoint = .zero
    @State private var isMovingOffset = false

    private var lastContentOffsetSubject = CurrentValueSubject<CGPoint, Never>(.zero)
    private var debouncedContentOffset: AnyPublisher<CGPoint, Never>

    init(
        index: Binding<Int>,
        elements: [Element],
        @ViewBuilder content: () -> Content
    ) {
        _index = index
        self.elements = elements
        self.content = content()

        // There is no easy way to deal with both offset and index binding.
        // So whenever the scrollview is scrolling, changes over the index binding will be ignore.
        // To do it, we are using a debounce over the changes of the contentOffset.
        // When the offset starts moving: the isMovingOffset is set to true
        // When the offset stops moving (after the debounce): the isMovingOffset is set to false
        debouncedContentOffset = lastContentOffsetSubject
            .debounce(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }

    var body: some View {
        ScrollViewReader { proxy in
            GeometryReader { geometry in
                TrackableScrollView(.horizontal, showsIndicators: false, contentOffset: $contentOffset) {
                    content
                }
                .onChange(of: index) { index in
                    if shouldUpdateOffset {
                        isMovingOffset = true
                        withAnimation { proxy.scrollTo(elements[index], anchor: .leading) }
                    }
                }
                .onChange(of: contentOffset) { contentOffset in
                    isMovingOffset = true

                    if shouldUpdateIndex(with: contentOffset, geometry: geometry) {
                        index = index(forOffset: contentOffset, geometry: geometry)
                    }

                    lastContentOffsetSubject.send(contentOffset)
                }
                .onReceive(debouncedContentOffset) { _ in
                    isMovingOffset = false
                }
            }
        }
    }
}

@available(iOS 14.0, *)
private extension FreeCarousel {
    func index(forIndex index: CGFloat) -> Int {
        let activeIndex = Int(Darwin.round(index))
        return max(0, min(activeIndex, elements.count - 1))
    }

    func index(forOffset offset: CGPoint, geometry: GeometryProxy) -> Int {
        let contentSize = geometry.size.width * CGFloat(elements.count - 1)
        return index(forIndex: (offset.x / contentSize) * CGFloat(elements.count - 1))
    }

    var scrollDirection: CarouselScrollDirection {
        let lastContentOffset = lastContentOffsetSubject.value

        if lastContentOffset == contentOffset {
            return .none
        } else if lastContentOffset.x < contentOffset.x {
            return .forward
        } else {
            return .backward
        }
    }

    func shouldUpdateIndex(with contentOffset: CGPoint, geometry: GeometryProxy) -> Bool {
        let oldIndex = index
        let newIndex = index(forOffset: contentOffset, geometry: geometry)

        switch scrollDirection {
        case .none:
            return false
        case .forward:
            return newIndex > oldIndex
        case .backward:
            return newIndex < oldIndex
        }
    }

    var shouldUpdateOffset: Bool {
        !isMovingOffset
    }
}
