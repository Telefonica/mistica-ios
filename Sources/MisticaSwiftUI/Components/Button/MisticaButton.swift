//
//  MisticaButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public enum ButtonBleedingAlignment {
    case leading, trailing, none
}

enum MisticaButtonRightImage {
    case chevron
    case custom(Image)

    var image: some View {
        switch self {
        case .chevron: return
            Image.chevron
                .resizable()
                .scaledToFit()
                .frame(idealWidth: 8, idealHeight: 20)
                .eraseToAnyView()
        case let .custom(image):
            return image
                .eraseToAnyView()
        }
    }

    var space: CGFloat {
        switch self {
        case .chevron: return 2
        case .custom: return 8
        }
    }
}

struct MisticaButton: View {
    enum Constants {
        static let minWidth: CGFloat = 76
        static let height: CGFloat = 24
        static let smallHeight: CGFloat = 16
        static let smallVerticalPadding: CGFloat = 8
        static let verticalPadding: CGFloat = 12
        static let horizontalPadding: CGFloat = 16
        static let transitionOffset: CGFloat = 40
    }

    enum ButtonState {
        case normal, selected, disabled, loading
    }

    struct Style {
        let bleedingAlignment: ButtonBleedingAlignment
        let styleByState: [ButtonState: StateStyle]
        let hasMinWidth: Bool

        init(
            bleedingAlignment: ButtonBleedingAlignment = .none,
            hasMinWidth: Bool = true,
            styleByState: [ButtonState: StateStyle]
        ) {
            self.bleedingAlignment = bleedingAlignment
            self.hasMinWidth = hasMinWidth
            self.styleByState = styleByState
        }

        func backgroundColor(for state: ButtonState) -> Color {
            styleByState[state]!.backgroundColor
        }

        func textColor(for state: ButtonState) -> Color {
            styleByState[state]!.textColor
        }

        func borderColor(for state: ButtonState) -> Color {
            styleByState[state]!.borderColor
        }
    }

    struct StateStyle {
        let textColor: Color
        let backgroundColor: Color
        let borderColor: Color
    }

    let configuration: ButtonStyle.Configuration
    let style: Style
    let small: Bool
    let rightImage: MisticaButtonRightImage?

    @Environment(\.misticaButtonLoadingInfo) private var loadingInfo
    @Environment(\.isEnabled) private var isEnabled

    public var body: some View {
        ScaledMisticaButton(
            height: height,
            small: small,
            minWidth: minWidth,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            borderColor: borderColor,
            leadingInset: leadingInset,
            trailingInset: trailingInset
        ) {
            content
        }
        .allowsHitTesting(!loadingInfo.isLoading)
    }
}

// MARK: Private extension

private extension MisticaButton {
    @ViewBuilder private var content: some View {
        ZStack {
            loadingView
                .offset(x: 0, y: loadingInfo.isLoading ? 0 : Constants.transitionOffset)
                .animation(.misticaTimingCurve, value: loadingInfo.isLoading)
                .accessibilityElement()
                .accessibilityLabel(loadingInfo.loadingTitle)
                .misticaBackport.accesibilityHidden(!loadingInfo.isLoading)

            HStack {
                configuration.label
                    .font(textFont)

                if let rightImage {
                    Spacer().frame(width: rightImage.space)
                    rightImage.image
                }
            }
            .offset(x: 0, y: loadingInfo.isLoading ? -Constants.transitionOffset : 0)
            .animation(.misticaTimingCurve, value: loadingInfo.isLoading)
            .misticaBackport.accesibilityHidden(loadingInfo.isLoading)
        }
    }

    @ViewBuilder private var loadingView: some View {
        HStack(spacing: 5) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))

            Text(loadingInfo.loadingTitle)
                .font(textFont)
        }
    }

    private var textFont: Font {
        small ? .textPreset2(weight: .button) : .textPreset3(weight: .button)
    }

    private var leadingInset: CGFloat {
        switch style.bleedingAlignment {
        case .leading:
            return -horizontalPadding
        case .trailing, .none:
            return 0
        }
    }

    private var trailingInset: CGFloat {
        switch style.bleedingAlignment {
        case .trailing:
            return -horizontalPadding
        case .leading, .none:
            return 0
        }
    }

    private var foregroundColor: Color {
        style.textColor(for: buttonState)
    }

    private var borderColor: Color {
        style.borderColor(for: buttonState)
    }

    private var backgroundColor: Color {
        style.backgroundColor(for: buttonState)
    }

    private var verticalPadding: CGFloat {
        small ? Constants.smallVerticalPadding : Constants.verticalPadding
    }

    private var horizontalPadding: CGFloat {
        Constants.horizontalPadding
    }

    private var height: CGFloat {
        small ? Constants.smallHeight : Constants.height
    }

    private var minWidth: CGFloat {
        style.hasMinWidth ? Constants.minWidth : 0
    }

    private var buttonState: ButtonState {
        if loadingInfo.isLoading {
            return .loading
        } else if !isEnabled {
            return .disabled
        } else if configuration.isPressed {
            return .selected
        } else {
            return .normal
        }
    }
}

// MARK: EnvironmentValues

public struct MisticaButtonLoadingInfo: Sendable {
    public let isLoading: Bool
    public let loadingTitle: String
}

private struct MisticaButtonEnvironmentKey: EnvironmentKey {
    static let defaultValue = MisticaButtonLoadingInfo(isLoading: false, loadingTitle: "")
}

public extension EnvironmentValues {
    var misticaButtonLoadingInfo: MisticaButtonLoadingInfo {
        get { self[MisticaButtonEnvironmentKey.self] }
        set { self[MisticaButtonEnvironmentKey.self] = newValue }
    }
}

public extension Button {
    func loading(_ loading: Bool, title: String = "") -> some View {
        environment(\.misticaButtonLoadingInfo, MisticaButtonLoadingInfo(isLoading: loading, loadingTitle: title))
    }
}

// MARK: Previews

#if DEBUG

    struct MisticaButton_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                VStack(alignment: .leading) {
                    Button("Primary") {}
                        .loading(true, title: "Large loading title")
                        .buttonStyle(.misticaPrimary())
                    Button("Secondary") {}
                        .buttonStyle(.misticaSecondary())
                    Button("Danger") {}
                        .buttonStyle(.misticaDanger())
                    Button("Link ") {}
                        .buttonStyle(.misticaLink())

                    Text("Some Text Label")
                    Button("Link leading leading") {}
                        .buttonStyle(.misticaLink(small: true, bleedingAlignment: .leading))
                    Button("Link bleeding none") {}
                        .buttonStyle(.misticaLink(small: true))
                }
                .padding()
            }
        }
    }

#endif
