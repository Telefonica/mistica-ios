//
//  TrackableScrollView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct TrackableScrollView<Content>: View where Content: View {
    private let axes: Axis.Set
    private let showsIndicators: Bool
    @Binding private var contentOffset: CGPoint
    private let content: Content

    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        contentOffset: Binding<CGPoint>,
        @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        _contentOffset = contentOffset
        self.content = content()
    }

    public var body: some View {
        GeometryReader { outsideProxy in
            ScrollView(axes, showsIndicators: showsIndicators) {
                content.background(offsetOverlay(outsideProxy: outsideProxy))
            }
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { [$contentOffset] value in
                $contentOffset.wrappedValue = value[0]
            }
        }
    }
}

// MARK: Private

private extension TrackableScrollView {
    func calculateContentOffset(fromOutsideProxy outsideProxy: GeometryProxy, insideProxy: GeometryProxy) -> CGPoint {
        let xOffset = outsideProxy.frame(in: .global).minX - insideProxy.frame(in: .global).minX
        let yOffset = outsideProxy.frame(in: .global).minY - insideProxy.frame(in: .global).minY
        return CGPoint(x: xOffset, y: yOffset)
    }

    @ViewBuilder
    func offsetOverlay(outsideProxy: GeometryProxy) -> some View {
        GeometryReader { insideProxy in
            Color.clear
                .preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: [calculateContentOffset(fromOutsideProxy: outsideProxy, insideProxy: insideProxy)]
                )
        }
    }
}

// MARK: PreferenceKey

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGPoint]

    static let defaultValue: [CGPoint] = [.zero]

    static func reduce(value: inout [CGPoint], nextValue: () -> [CGPoint]) {
        value.append(contentsOf: nextValue())
    }
}
