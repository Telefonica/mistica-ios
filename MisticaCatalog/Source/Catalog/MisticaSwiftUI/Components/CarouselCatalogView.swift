//
//  CarouselCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct CarouselCatalogView: View {
    @State var hasFullWidthStyle = false
    @State var hasAutoplay = false
    @State var autoplayTimeIntervalSelectedIndex = 0
    @State var autoplayTimeIntervalOptions = [1, 3, 5]
    @State var hasPagination = true
    @State var hasControls = true
    @State var isEnabled = true
    @State var numberOfItems = 5
    @State var index = 0

    var items: ClosedRange<Int> {
        0 ... numberOfItems
    }

    var body: some View {
        List {
            section("Style") {
                Toggle("Fullwidth Style", isOn: $hasFullWidthStyle)
                Toggle("Has Pagination", isOn: $hasPagination)
                Toggle("Has Controls", isOn: $hasControls)
                Toggle("Enabled", isOn: $isEnabled)
            }
            section("Items") {
                Stepper("Number of Items: \(numberOfItems)", value: $numberOfItems)
            }
            section("Autoplay") {
                Toggle("Autoplay Enabled", isOn: $hasAutoplay)
                timePicker
            }

            NavigationLink("Show") {
                Carousel(items, id: \.self, index: $index, spacing: 0, headspace: 0) { item in
                    VStack {
                        Color.brand
                            .expand()

                        VStack(alignment: .leading, spacing: 16) {
                            Text("\(item) Lorem ipsum dolor sit amet")
                                .font(.textPreset6())
                                .foregroundColor(.textPrimary)
                                .lineLimit(3)

                            Text("Consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam")
                                .font(.textPreset4(weight: .light))
                                .foregroundColor(.textSecondary)
                                .lineLimit(4)
                        }
                        .padding(24)
                    }
                }
                .autoplay(hasAutoplay ? .active(TimeInterval(autoplayTimeIntervalOptions[autoplayTimeIntervalSelectedIndex])) : .inactive)
                .scrollStyle(hasPagination ? .paginated : .free)
                .controlsStyle(hasControls ? .bullets : .disabled)
                .controlLeadingItem {
                    Button("Anterior", action: previous)
                        .buttonStyle(.misticaLink(small: true))
                        .disabled(previousIndex == nil)
                }
                .controlTrailingItem {
                    Button("Siguiente", action: next)
                        .buttonStyle(.misticaLink(small: true))
                        .disabled(nextIndex == nil)
                }
                .disabled(!isEnabled)
                .navigationTitle("Carousel")
            }
        }
    }

    @ViewBuilder
    var timePicker: some View {
        picker($autoplayTimeIntervalSelectedIndex, options: autoplayTimeIntervalOptions)
            .pickerStyle(SegmentedPickerStyle())
    }

    var nextIndex: Int? {
        let nextIndex = index + 1
        return items.contains(nextIndex) ? nextIndex : nil
    }

    var previousIndex: Int? {
        let previousIndex = index - 1
        return items.contains(previousIndex) ? previousIndex : nil
    }

    func next() {
        guard let nextIndex = nextIndex else { return }
        index = nextIndex
    }

    func previous() {
        guard let previousIndex = previousIndex else { return }
        index = previousIndex
    }
}

#if DEBUG
    struct CarouselCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                CarouselCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
