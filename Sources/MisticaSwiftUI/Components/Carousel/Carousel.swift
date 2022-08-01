//
//  Carousel.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Combine
import MisticaCommon
import SwiftUI

@available(iOS 14.0, *)
public struct Carousel<Data: RandomAccessCollection, ID: Hashable, Content: View>: View {
    @Binding private var index: Int
    private let content: (Data.Element) -> Content
    private let elements: [Data.Element]
    private let id: KeyPath<Data.Element, ID>
    private let spacing: CGFloat
    private let headspace: CGFloat
    private let leadingSpacing: CGFloat
    private let trailingSpacing: CGFloat

    private var style: CarouselStyle = .default
    private var autoplay = CarouselAutoplay.inactive
    private var scrollStyle = CarouselScrollStyle.paginated
    private var controlStyle = CarouselControlStyle.bullets
    private var controlLeadingItem: AnyView?
    private var controlTrailingItem: AnyView?
    private var controlSpacing: CGFloat = 0
    private var controlAlignment: Alignment = .bottom

    @State private var contentSize: CGSize = .zero
    @Environment(\.isEnabled) private var isEnabled

    public var body: some View {
        GeometryReader { geometry in
            stack {
                carousel(geometry: geometry) {
                    dataView(geometry: geometry)
                }
                pageControl
            }
            .padding(.leading, leadingSpacing)
            .padding(.trailing, trailingSpacing)
            .onReceive(timer: timer, perform: receiveTimer)
        }
        .clipped()
    }

    @ViewBuilder
    func stack<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        switch style {
        case .default:
            VStack(alignment: controlAlignment.horizontal, spacing: 24) {
                content()
            }
        case .fullWidth:
            ZStack(alignment: controlAlignment) {
                content()
            }
        }
    }

    @ViewBuilder
    func carousel<T: View>(geometry: GeometryProxy, @ViewBuilder content: () -> T) -> some View {
        switch scrollStyle {
        case .free:
            FreeCarousel(
                index: $index,
                elements: elements.map { $0[keyPath: id] },
                content: content
            )
        case .paginated:
            PaginatedCarousel(
                index: $index,
                itemWidth: itemWidth(geometry: geometry),
                spacing: spacing,
                elements: elements,
                content: content
            )
        }
    }

    @ViewBuilder
    func dataView(geometry: GeometryProxy) -> some View {
        HStack(alignment: .center, spacing: spacing) {
            ForEach(elements, id: id) {
                content($0)
                    .frame(width: itemWidth(geometry: geometry), alignment: .center)
            }
        }
    }

    @ViewBuilder
    var pageControl: some View {
        switch controlStyle {
        case .disabled:
            EmptyView()
        case .bullets:
            HStack(alignment: .center, spacing: controlSpacing) {
                controlLeadingItem.map { TupleView(($0, Spacer())) }
                PageControl(items: elements.count, selectedItem: $index)
                controlTrailingItem.map { TupleView((Spacer(), $0)) }
            }
        }
    }
}

// MARK: Items

@available(iOS 14.0, *)
private extension Carousel {
    var defaultPadding: CGFloat {
        headspace + spacing * 2
    }

    func itemWidth(geometry: GeometryProxy) -> CGFloat {
        max(0, geometry.size.width - defaultPadding)
    }
}

// MARK: Autoplay

@available(iOS 14.0, *)
private extension Carousel {
    var timer: TimePublisher? {
        guard autoplay.isActive else { return nil }
        return Timer.publish(every: autoplay.interval, on: .main, in: .default).autoconnect()
    }

    func receiveTimer(_ value: Timer.TimerPublisher.Output) {
        if index == elements.count - 1 {
            index = 0
        } else {
            index += 1
        }
    }
}

// MARK: Modifiers

@available(iOS 14.0, *)
public extension Carousel {
    func carouselStyle(_ style: CarouselStyle) -> Carousel {
        var carousel = self
        carousel.style = style
        return carousel
    }

    func autoplay(_ carouselAutoScroll: CarouselAutoplay) -> Carousel {
        var carousel = self
        carousel.autoplay = carouselAutoScroll
        return carousel
    }

    func scrollStyle(_ scrollStyle: CarouselScrollStyle) -> Carousel {
        var carousel = self
        carousel.scrollStyle = scrollStyle
        return carousel
    }

    func controlsStyle(
        _ controlStyle: CarouselControlStyle,
        spacing: CGFloat? = nil,
        alignment: Alignment? = nil
    ) -> Carousel {
        var carousel = self
        carousel.controlStyle = controlStyle
        if let spacing = spacing {
            carousel.controlSpacing = spacing
        }
        if let alignment = alignment {
            carousel.controlAlignment = alignment
        }
        return carousel
    }

    func controlLeadingItem<T: View>(
        @ViewBuilder content: () -> T
    ) -> Carousel {
        var carousel = self
        carousel.controlLeadingItem = AnyView(content())
        return carousel
    }

    func controlTrailingItem<T: View>(
        @ViewBuilder content: () -> T
    ) -> Carousel {
        var carousel = self
        carousel.controlTrailingItem = AnyView(content())
        return carousel
    }
}

// MARK: Initializers

@available(iOS 14.0, *)
public extension Carousel {
    init(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        index: Binding<Int> = .constant(0),
        spacing: CGFloat = 8,
        headspace: CGFloat = 16,
        leadingSpacing: CGFloat = 0,
        trailingSpacing: CGFloat = 0,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        guard index.wrappedValue < data.count else {
            fatalError("The index should be less than the count of data ")
        }

        _index = index
        elements = Array(data)
        self.id = id
        self.spacing = spacing
        self.headspace = headspace
        self.leadingSpacing = leadingSpacing
        self.trailingSpacing = trailingSpacing
        self.content = content
    }
}

@available(iOS 14.0, *)
public extension Carousel where ID == Data.Element.ID, Data.Element: Identifiable {
    init(
        _ data: Data,
        index: Binding<Int> = .constant(0),
        spacing: CGFloat = 8,
        headspace: CGFloat = 16,
        leadingSpacing: CGFloat = 0,
        trailingSpacing: CGFloat = 0,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.init(
            data,
            id: \.id,
            index: index,
            spacing: spacing,
            headspace: headspace,
            leadingSpacing: leadingSpacing,
            trailingSpacing: trailingSpacing,
            content: content
        )
    }
}

// MARK: Previews

#if DEBUG
    @available(iOS 14.0, *)
    struct DataCardCarousel: View {
        @State var index = 0

        var body: some View {
            Carousel(
                0 ... 5,
                id: \.self, index: $index,
                spacing: 8,
                headspace: 40,
                leadingSpacing: 8,
                trailingSpacing: 8
            ) { index in
                DataCard(
                    assetType: .image(image: Image(systemName: "photo")),
                    headline: { Tag(style: .promo, text: "headline") },
                    title: index == 0 ? "title" : "large large large large large large large large title",
                    subtitle: "subtitle",
                    description: "description",
                    primaryButton: {
                        Button(action: {}, label: { Text("Primary") })
                    }, linkButton: {
                        Button(action: {}, label: { Text("Link") })
                    }, fragmentView: {
                        Spacer()
                    }
                )
                .fixedVerticalContentSize(false)
            }
            .frame(maxHeight: 350)
        }
    }

    @available(iOS 14.0, *)
    struct Carousel_Previews: PreviewProvider {
        static var previews: some View {
            DataCardCarousel()
        }
    }

#endif
