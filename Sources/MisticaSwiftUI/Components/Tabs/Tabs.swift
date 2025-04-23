//
//  Tabs.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct Tabs: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var itemWidth: [Int: CGFloat] = [:]

    private var tabItemViews: [TabItemView] = []
    @Binding private var selection: Int
    private var background: Color

    public init(_ items: [TabItem], selection: Binding<Int>, background: Color = .background) {
        _selection = selection
        self.background = background
        for (index, tabItem) in items.enumerated() {
            tabItemViews.append(
                TabItemView(
                    tabItem: tabItem,
                    indexRow: index,
                    selectedIndexRow: $selection
                )
            )
        }
    }

    public var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack(alignment: .leading) {
                    itemsView(parentSize: proxy.size)
                        .animation(.misticaTimingCurve, value: selection)

                    dividerLine()
                        .expandHorizontally()

                    selectedLine()
                        .animation(.misticaTimingCurve, value: selection)
                }
            }
        }
        .onChange(of: tabItemViews, perform: { _ in itemWidth = [:] })
        .frame(height: 56)
        .background(background)
    }

    @ViewBuilder
    func itemsView(parentSize: CGSize) -> some View {
        LazyHStack(spacing: 0) {
            ForEach(0 ..< self.tabItemViews.count, id: \.self) { index in
                itemView(for: index)
                    // The width depends on the number of items.
                    .frame(width: itemWidth(parentSize: parentSize, index: index))
                    // This proxy will store the intrinsec content size of each element
                    // We need it to calculat the offset of the selected line.
                    .background(
                        GeometryReader { proxy in
                            Color.clear.preference(key: CGFloatPreferenceKey.self, value: proxy.size.width)
                        }
                    )
                    // Store the new value whenever it changes.
                    .onPreferenceChange(CGFloatPreferenceKey.self) { [$itemWidth] width in
                        $itemWidth[index].wrappedValue = min(width, 208)
                    }
                    .onTapGesture {
                        self.selection = index
                    }
            }
        }
    }

    var itemHorizontalPadding: CGFloat {
        horizontalSizeClass == .compact ? 16 : 32
    }

    @ViewBuilder
    func itemView(for index: Int) -> some View {
        tabItemViews[index]
            .padding(.horizontal, itemHorizontalPadding)
    }

    func itemWidth(parentSize: CGSize, index: Int) -> CGFloat? {
        if shouldUseScroll {
            return itemWidth[index]
        } else {
            return parentSize.width / CGFloat(tabItemViews.count)
        }
    }

    @ViewBuilder
    func selectedLine() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.controlActivated)
        }
        .frame(width: itemWidth[selection])
        .offset(x: selectedLineOffset(), y: 0)
    }

    func selectedLineOffset() -> CGFloat {
        (0 ..< selection)
            .compactMap { itemWidth[$0] }
            .reduce(0,+)
    }

    @ViewBuilder
    func dividerLine() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            Divider()
        }
    }

    var shouldUseScroll: Bool {
        tabItemViews.count > 3
    }
}

// MARK: PreferenceKey

struct CGFloatPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static let defaultValue: Value = 0

    static func reduce(value _: inout Value, nextValue: () -> Value) {
        _ = nextValue()
    }
}

// MARK: Previews

#if DEBUG
    struct TabsContainer: View {
        @State private var selection = 0

        var body: some View {
            Tabs([.init(text: "Large text"), .init(text: "Large text")], selection: $selection)
        }
    }

    struct Tabs_Previews: PreviewProvider {
        static var previews: some View {
            TabsContainer()
        }
    }
#endif
