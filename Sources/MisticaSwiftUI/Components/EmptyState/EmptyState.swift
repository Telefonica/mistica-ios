import Foundation
import SwiftUI
import Shared

@available(iOS 13.0, *)
public enum EmptyStateAssetType {
    case fullWidth(Image)
    case image(Image)
    case icon(Image, foregroundColor: Color?, backgroundColor: Color?)
}

@available(iOS 13.0, *)
public struct EmptyState<PrimaryButton: View, SecondaryButton: View>: View {
    let assetType: EmptyStateAssetType
    let title: String
    let description: String?
    let primaryButton: PrimaryButton?
    let secondaryButton: SecondaryButton?

    public var titleLineLimit = 1
    public var descriptionLineLimit = 2

    public var assetAccessibilityLabel: String?
    public var assetAccessibilityIdentifier: String?
    public var titleAccessibilityLabel: String?
    public var titleAccessibilityIdentifier: String?
    public var descriptionAccessibilityLabel: String?
    public var descriptionAccessibilityIdentifier: String?

    fileprivate init(
        assetType: EmptyStateAssetType,
        title: String,
        description: String?,
        primaryButton: PrimaryButton?,
        secondaryButton: SecondaryButton?
    ) {
        self.assetType = assetType
        self.title = title
        self.description = description
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            assetView
                .accessibilityLabel(assetAccessibilityLabel)
                .accessibilityIdentifier(assetAccessibilityIdentifier)

            Spacer().frame(height: 24)

            Text(title)
                .font(.textPreset6(weight: .light))
                .foregroundColor(.textPrimary)
                .lineLimit(titleLineLimit)
                .accessibilityLabel(titleAccessibilityLabel)
                .accessibilityIdentifier(titleAccessibilityIdentifier)

            Spacer().frame(height: 16)

            description.map {
                Text($0)
                    .font(.textPreset4(weight: .regular))
                    .foregroundColor(.textSecondary)
                    .lineLimit(descriptionLineLimit)
                    .accessibilityLabel(descriptionAccessibilityLabel)
                    .accessibilityIdentifier(descriptionAccessibilityIdentifier)
            }

            Spacer().frame(height: 24)

            HStack(alignment: .center, spacing: 24) {
                primaryButton?
                    .buttonStyle(.misticaPrimary(small: true))
                secondaryButton
                    .buttonStyle(.misticaSecondary(small: true))
            }
            .expandHorizontally(alignment: .leading)
        }
        .padding(24)
    }
}

// MARK: Public

@available(iOS 13.0, *)
public extension EmptyState {
    func cardStyle() -> some View {
        border(cornerRadius: 4, borderColor: .border, lineWidth: 1)
    }

    func titleLineLimit(_ titleLineLimit: Int) -> EmptyState {
        var view = self
        view.titleLineLimit = titleLineLimit
        return view
    }

    func descriptionLineLimit(_ descriptionLineLimit: Int) -> EmptyState {
        var view = self
        view.descriptionLineLimit = descriptionLineLimit
        return view
    }

    func assetAccessibilityLabel(_ assetAccessibilityLabel: String?) -> EmptyState {
        var view = self
        view.assetAccessibilityLabel = assetAccessibilityLabel
        return view
    }

    func assetAccessibilityIdentifier(_ assetAccessibilityIdentifier: String?) -> EmptyState {
        var view = self
        view.assetAccessibilityIdentifier = assetAccessibilityIdentifier
        return view
    }

    func titleAccessibilityLabel(_ titleAccessibilityLabel: String?) -> EmptyState {
        var view = self
        view.titleAccessibilityLabel = titleAccessibilityLabel
        return view
    }

    func titleAccessibilityIdentifier(_ titleAccessibilityIdentifier: String?) -> EmptyState {
        var view = self
        view.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        return view
    }

    func descriptionAccessibilityLabel(_ descriptionAccessibilityLabel: String?) -> EmptyState {
        var view = self
        view.descriptionAccessibilityLabel = descriptionAccessibilityLabel
        return view
    }

    func descriptionAccessibilityIdentifier(_ descriptionAccessibilityIdentifier: String?) -> EmptyState {
        var view = self
        view.descriptionAccessibilityIdentifier = descriptionAccessibilityIdentifier
        return view
    }
}

// MARK: Private

@available(iOS 13.0, *)
private extension EmptyState {
    @ViewBuilder
    var assetView: some View {
        switch assetType {
        case .fullWidth(let image):
            image
                .resizable()
                .aspectRatio(16 / 9, contentMode: .fill)
                .expandHorizontally(alignment: .leading)
        case .image(let image):
            image
                .resizable()
                .scaledToFit()
                .frame(height: 112)
        case .icon(let image, let foregroundColor, let backgroundColor):
            image
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
        }
    }
}

// MARK: Inits

@available(iOS 13.0, *)
public extension EmptyState {
    init(
        assetType: EmptyStateAssetType,
        title: String,
        description: String? = nil,
        @ViewBuilder primaryButton: () -> PrimaryButton,
        @ViewBuilder secondaryButton: () -> SecondaryButton
    ) {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            primaryButton: primaryButton(),
            secondaryButton: secondaryButton()
        )
    }
}

@available(iOS 13.0, *)
public extension EmptyState where PrimaryButton == EmptyView {
    init(
        assetType: EmptyStateAssetType,
        title: String,
        description: String? = nil,
        @ViewBuilder secondaryButton: () -> SecondaryButton
    ) {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            primaryButton: nil,
            secondaryButton: secondaryButton()
        )
    }
}

@available(iOS 13.0, *)
public extension EmptyState where SecondaryButton == EmptyView {
    init(
        assetType: EmptyStateAssetType,
        title: String,
        description: String? = nil,
        @ViewBuilder primaryButton: () -> PrimaryButton
    ) {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            primaryButton: primaryButton(),
            secondaryButton: nil
        )
    }
}

@available(iOS 13.0, *)
public extension EmptyState where PrimaryButton == EmptyView, SecondaryButton == EmptyView {
    init(
        assetType: EmptyStateAssetType,
        title: String,
        description: String? = nil
    ) {
        self.init(
            assetType: assetType,
            title: title,
            description: description,
            primaryButton: nil,
            secondaryButton: nil
        )
    }
}

#if DEBUG
    @available(iOS 13.0, *)
    struct EmptyCase_Previews: PreviewProvider {
        static var previews: some View {
            EmptyState(
                assetType: .icon(Image.arrowRight, foregroundColor: .red, backgroundColor: .blue),
                title: "Title",
                description: "Description",
                primaryButton: {
                    Button("Primary") {}
                },
                secondaryButton: {
                    Button("Secondary") {}
                }
            )
        }
    }
#endif
