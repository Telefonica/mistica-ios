//
//  Cell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

private enum Constants {
    static let spacing: CGFloat = 16
    static let borderRadius: CGFloat = 4
    static let largeImageSize: CGFloat = 40
    static let smallImageSize: CGFloat = 24
    static let minCellHeight: CGFloat = 72
}

public enum CellStyle {
    case boxed
    case fullwidth
}

public enum CellAssetType: Equatable {
    case none
    case roundImage(Image)
    case squaredImage(Image, size: CGSize)
    case smallIcon(Image, foregroundColor: Color? = nil)
    case largeIcon(Image, foregroundColor: Color? = nil, backgroundColor: Color? = nil)
}

public struct Cell<PresetView: View, HeadlineView: View, Destination: View>: View {
    private let style: CellStyle
    private let title: String
    private let subtitle: String?
    private let description: String?
    private let assetType: CellAssetType
    private let presetView: PresetView
    private let headlineView: HeadlineView
    private var destination: Destination?

    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?
    private var subtitleAccessibilityLabel: String?
    private var subtitleAccessibilityIdentifier: String?
    private var descriptionAccessibilityLabel: String?
    private var descriptionAccessibilityIdentifier: String?
    private var imageAccessibilityLabel: String?
    private var imageAccessibilityIdentifier: String?
    private var titleLineLimit: Int? = 2
    private var subtitleLineLimit: Int? = 2
    private var descriptionLineLimit: Int? = 2
    private var backgroundColor = Color.backgroundContainer
    private var pressedBackgroundColor = Color.neutralLow.opacity(0.8)
    private var allowsPressing = true

    @State var isPressed = false

    public init(
        style: CellStyle,
        title: String,
        subtitle: String?,
        description: String?,
        assetType: CellAssetType = .none,
        @ViewBuilder presetView: () -> PresetView,
        @ViewBuilder headlineView: () -> HeadlineView,
        @ViewBuilder destinationView: () -> Destination?
    ) {
        self.style = style
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.assetType = assetType
        self.presetView = presetView()
        self.headlineView = headlineView()
        destination = destinationView()
    }

    public var body: some View {
        switch style {
        case .boxed:
            coreView
                .border(cornerRadius: Constants.borderRadius, borderColor: .border)
                .padding(.vertical, Constants.spacing / 2)
                .padding(.horizontal, Constants.spacing)
                .if(allowsPressing) {
                    $0.overlay(cellLink)
                }

        case .fullwidth:
            coreView
                .overlay(divider, alignment: .bottom)
                .if(allowsPressing) {
                    $0.overlay(cellLink)
                }
        }
    }

    @ViewBuilder
    private var coreView: some View {
        // Preset view has to be align at center
        HStack(alignment: .center, spacing: 0) {
            // Image view has to be align at top
            HStack(alignment: (subtitle != nil || description != nil) ? .top : .center, spacing: 0) {
                imageView
                    .padding(.trailing, Constants.spacing)
                    .accessibilityLabel(imageAccessibilityLabel)
                    .accessibilityIdentifier(imageAccessibilityIdentifier)

                VStack(alignment: .leading, spacing: Constants.spacing / 2) {
                    headlineView

                    Text(title)
                        .font(.textPreset3(weight: .regular))
                        .foregroundColor(.textPrimary)
                        .lineLimit(titleLineLimit)
                        .accessibilityLabel(titleAccessibilityLabel)
                        .accessibilityIdentifier(titleAccessibilityIdentifier)

                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.textPreset2(weight: .regular))
                            .foregroundColor(.textSecondary)
                            .lineLimit(subtitleLineLimit)
                            .accessibilityLabel(subtitleAccessibilityLabel)
                            .accessibilityIdentifier(subtitleAccessibilityIdentifier)
                    }

                    if let description = description {
                        Text(description)
                            .font(.textPreset2(weight: .regular))
                            .foregroundColor(.textSecondary)
                            .lineLimit(descriptionLineLimit)
                            .accessibilityLabel(descriptionAccessibilityLabel)
                            .accessibilityIdentifier(descriptionAccessibilityIdentifier)
                    }
                }
                .expandHorizontally(alignment: .leading)
            }

            presetView
        }
        .padding(Constants.spacing)
        .frame(minHeight: Constants.minCellHeight)
        .background(background)
        .animation(.linear(duration: 0.1), value: isPressed)
        .listRowBackground(Color.background)
        .listSeparatorHidden()
    }

    @ViewBuilder
    private var imageView: some View {
        switch assetType {
        case .none:
            EmptyView()
        case let .roundImage(image):
            image
                .renderingMode(.original)
                .frame(width: Constants.largeImageSize, height: Constants.largeImageSize, alignment: .center)
                .round(cornerRadius: Constants.largeImageSize / 2)
        case let .squaredImage(image, size):
            image
                .renderingMode(.original)
                .frame(width: size.width, height: size.height, alignment: .center)
                .round(cornerRadius: 8)

        case let .smallIcon(image, tintColor):
            image
                .renderingMode((tintColor != nil) ? .template : .original)
                .frame(width: Constants.smallImageSize, height: Constants.smallImageSize, alignment: .center)
                .foregroundColor(tintColor)
        case let .largeIcon(image, tintColor, backgroundColor):
            image
                .renderingMode((tintColor != nil) ? .template : .original)
                .frame(width: Constants.largeImageSize, height: Constants.largeImageSize, alignment: .center)
                .foregroundColor(tintColor)
                .background(backgroundColor)
                .round(cornerRadius: Constants.largeImageSize / 2)
        }
    }

    @ViewBuilder
    private var divider: some View {
        Divider().padding(.horizontal, Constants.spacing)
    }

    @ViewBuilder
    private var background: some View {
        isPressed ? pressedBackgroundColor : backgroundColor
    }

    @ViewBuilder
    private var cellLink: some View {
        CellLink(isPressed: $isPressed, destination: { destination })
    }
}

// MARK: Utils

public extension Cell {
    /// Sets a NavigationLink as a background with no opacity. This behaves as a workaround to avoid
    /// NavigationLinks to add extra views to the Cell inside List. Otherwise, the system will add the default chevron.
    func navigationLink<T: View>(to destination: () -> T) -> Cell<PresetView, HeadlineView, T> {
        var cell = Cell<PresetView, HeadlineView, T>(
            style: style,
            title: title,
            subtitle: subtitle,
            description: description,
            assetType: assetType,
            presetView: { presetView },
            headlineView: { headlineView },
            destinationView: destination
        )
        cell.allowsPressing = true
        return cell
    }
}

// MARK: Cell with no preset nor headline

public extension Cell where Destination == EmptyView {
    init(
        style: CellStyle,
        title: String,
        subtitle: String? = nil,
        description: String? = nil,
        assetType: CellAssetType = .none,
        @ViewBuilder presetView: () -> PresetView,
        @ViewBuilder headlineView: () -> HeadlineView
    ) {
        self.init(
            style: style,
            title: title,
            subtitle: subtitle,
            description: description,
            assetType: assetType,
            presetView: presetView,
            headlineView: headlineView,
            destinationView: { EmptyView?.none }
        )
    }
}

public extension Cell where PresetView == EmptyView, HeadlineView == EmptyView, Destination == EmptyView {
    init(
        style: CellStyle,
        title: String,
        subtitle: String? = nil,
        description: String? = nil,
        assetType: CellAssetType = .none
    ) {
        self.init(
            style: style,
            title: title,
            subtitle: subtitle,
            description: description,
            assetType: assetType,
            presetView: { EmptyView() },
            headlineView: { EmptyView() }
        )
    }
}

// MARK: Cell with no preset

public extension Cell where PresetView == EmptyView, Destination == EmptyView {
    init(
        style: CellStyle,
        title: String,
        subtitle: String? = nil,
        description: String? = nil,
        assetType: CellAssetType = .none,
        @ViewBuilder headlineView: () -> HeadlineView
    ) {
        self.init(
            style: style,
            title: title,
            subtitle: subtitle,
            description: description,
            assetType: assetType,
            presetView: { EmptyView() },
            headlineView: headlineView
        )
    }
}

// MARK: Cell with no headline

public extension Cell where HeadlineView == EmptyView, Destination == EmptyView {
    init(
        style: CellStyle,
        title: String,
        subtitle: String? = nil,
        description: String? = nil,
        assetType: CellAssetType = .none,
        @ViewBuilder presetView: () -> PresetView
    ) {
        self.init(
            style: style,
            title: title,
            subtitle: subtitle,
            description: description,
            assetType: assetType,
            presetView: presetView,
            headlineView: { EmptyView() }
        )
    }
}

// MARK: Modifiers

public extension Cell {
    func titleAccessibilityLabel(_ titleAccessibilityLabel: String?) -> Cell {
        var cell = self
        cell.titleAccessibilityLabel = titleAccessibilityLabel
        return cell
    }

    func titleAccessibilityIdentifier(_ titleAccessibilityIdentifier: String?) -> Cell {
        var cell = self
        cell.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        return cell
    }

    func subtitleAccessibilityLabel(_ subtitleAccessibilityLabel: String?) -> Cell {
        var cell = self
        cell.subtitleAccessibilityLabel = subtitleAccessibilityLabel
        return cell
    }

    func subtitleAccessibilityIdentifier(_ subtitleAccessibilityIdentifier: String?) -> Cell {
        var cell = self
        cell.subtitleAccessibilityIdentifier = subtitleAccessibilityIdentifier
        return cell
    }

    func descriptionAccessibilityLabel(_ descriptionAccessibilityLabel: String?) -> Cell {
        var cell = self
        cell.descriptionAccessibilityLabel = descriptionAccessibilityLabel
        return cell
    }

    func descriptionAccessibilityIdentifier(_ descriptionAccessibilityIdentifier: String?) -> Cell {
        var cell = self
        cell.descriptionAccessibilityIdentifier = descriptionAccessibilityIdentifier
        return cell
    }

    func imageAccessibilityLabel(_ imageAccessibilityLabel: String?) -> Cell {
        var cell = self
        cell.imageAccessibilityLabel = imageAccessibilityLabel
        return cell
    }

    func imageAccessibilityIdentifier(_ imageAccessibilityIdentifier: String?) -> Cell {
        var cell = self
        cell.imageAccessibilityIdentifier = imageAccessibilityIdentifier
        return cell
    }

    func titleLineLimit(_ titleLineLimit: Int?) -> Cell {
        var cell = self
        cell.titleLineLimit = titleLineLimit
        return cell
    }

    func subtitleLineLimit(_ subtitleLineLimit: Int?) -> Cell {
        var cell = self
        cell.subtitleLineLimit = subtitleLineLimit
        return cell
    }

    func descriptionLineLimit(_ descriptionLineLimit: Int?) -> Cell {
        var cell = self
        cell.descriptionLineLimit = descriptionLineLimit
        return cell
    }

    func backgroundColor(_ backgroundColor: Color) -> Cell {
        var cell = self
        cell.backgroundColor = backgroundColor
        return cell
    }

    func pressedBackgroundColor(_ pressedBackgroundColor: Color) -> Cell {
        var cell = self
        cell.pressedBackgroundColor = pressedBackgroundColor
        return cell
    }

    /// Configures whether this view has press highlight effect or not.
    func allowsPressing(_ allowsPressing: Bool) -> Cell {
        var cell = self
        cell.allowsPressing = allowsPressing
        return cell
    }
}

// MARK: Helpers

struct ListSeparatorHiddenModifieriOS15: ViewModifier {
    public func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
        } else {
            content
                .listRowInsets(EdgeInsets())
                .overlay(
                    VStack {
                        Divider(color: .background)
                        Spacer()
                        Divider(color: .background)
                    }
                )
        }
    }
}

struct ListSeparatorHiddenModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .listRowInsets(EdgeInsets())
            .overlay(
                VStack {
                    Divider(color: .background)
                    Spacer()
                    Divider(color: .background)
                }
            )
    }
}

public extension View {
    func listSeparatorHidden() -> some View {
        conditionalModifier(
            .iOS15,
            then: { $0.modifier(ListSeparatorHiddenModifieriOS15()) },
            else: { $0.modifier(ListSeparatorHiddenModifier()) }
        )
    }
}

// MARK: Previews

#if DEBUG
        struct Cell_Previews: PreviewProvider {
        static let photo = Image(systemName: "photo")
        @State static var isEnabled = false

        static var previews: some View {
            Preview {
                NavigationView {
                    List {
                        section(style: .boxed, headerText: "Boxed")
                        section(style: .fullwidth, headerText: "Fullwidth")
                    }
                    .misticaListStyle()
                    .misticaBackport.navigationBarTitle("Lists")
                    .misticaNavigationViewStyle()
                }
            }
        }

        static func section(style: CellStyle, headerText: String) -> some View {
            Section {
                Group {
                    Cell(style: style, title: "Title")
                    Cell(style: style, title: "Title", subtitle: "subtitle")
                    Cell(style: style, title: "Title", subtitle: "subtitle", description: "description")
                    Cell(style: style, title: "Title", assetType: .smallIcon(photo, foregroundColor: .borderDark))
                    Cell(style: style, title: "Title", subtitle: "subtitle", assetType: .roundImage(photo))
                    Cell(style: style, title: "Title", subtitle: "subtitle", assetType: .largeIcon(photo, foregroundColor: .white, backgroundColor: .brandHigh))
                    Cell(style: style, title: "Title", subtitle: "subtitle", assetType: .smallIcon(photo, foregroundColor: .borderDark))
                    Cell(style: style, title: "Title", subtitle: "subtitle", assetType: .smallIcon(photo, foregroundColor: .borderDark), presetView: { CellNavigationPreset() })
                    Cell(style: style, title: "Title", subtitle: "subtitle", assetType: .smallIcon(photo, foregroundColor: .borderDark), presetView: { CellNavigationPreset(badgeStyle: .flag) })
                    Cell(style: style, title: "Title", subtitle: "subtitle", assetType: .smallIcon(photo, foregroundColor: .borderDark), presetView: { CellNavigationPreset(badgeStyle: .numeric(10)) })
                }
                Group {
                    Cell(style: style, title: "Title", subtitle: "subtitle", assetType: .smallIcon(photo, foregroundColor: .borderDark), presetView: { Toggle("", isOn: $isEnabled) })
                    Cell(style: style, title: "Title", subtitle: "subtitle", assetType: .smallIcon(photo, foregroundColor: .borderDark), headlineView: { Tag(style: .promo, text: "TAG LABEL") })
                }
            } header: {
                Text(headerText)
                    .font(.textPreset4(weight: .medium))
                    .foregroundColor(.textSecondary)
                    .expand(alignment: .leading)
                    .padding(16)
            }
        }
    }
#endif
