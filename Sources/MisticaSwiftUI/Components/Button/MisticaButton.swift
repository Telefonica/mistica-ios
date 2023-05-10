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

    @Environment(\.misticaButtonLoadingInfo) private var loadingInfo
    @Environment(\.isEnabled) private var isEnabled

    public var body: some View {
        ZStack {
            loadingView
                .offset(x: 0, y: loadingInfo.isLoading ? 0 : Constants.transitionOffset)
                .animation(.misticaTimingCurve, value: loadingInfo.isLoading)
                .accessibilityElement()
                .accessibilityLabel(loadingInfo.loadingTitle)
                .misticaBackport.accesibilityHidden(!loadingInfo.isLoading)

            configuration.label
                .font(textFont)
                .offset(x: 0, y: loadingInfo.isLoading ? -Constants.transitionOffset : 0)
                .animation(.misticaTimingCurve, value: loadingInfo.isLoading)
                .misticaBackport.accesibilityHidden(loadingInfo.isLoading)
        }
        .frame(height: height)
        .if(!small) { $0.expandHorizontally() }
        .frame(minWidth: minWidth)
        .padding(.vertical, verticalPadding)
        .padding(.horizontal, Constants.horizontalPadding)
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .border(radiusStyle: .button, borderColor: borderColor)
        .padding(EdgeInsets(top: 0, leading: leadingInset, bottom: 0, trailing: trailingInset))
        .allowsHitTesting(!loadingInfo.isLoading)
    }

    @ViewBuilder private var loadingView: some View {
        HStack(spacing: 5) {
            if #available(iOS 14.0, *) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
            } else {
                // Fallback on earlier versions
                ActivityIndicator(
                    isAnimating: .constant(true),
                    style: .medium,
                    color: foregroundColor
                )
            }

            Text(loadingInfo.loadingTitle)
                .font(textFont)
        }
    }

    private var textFont: Font {
        small ? .textPreset2(weight: .medium) : .textPreset3(weight: .medium)
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

public struct MisticaButtonLoadingInfo {
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

// This is only to support iOS 13 and replace ProgressView()
@available(iOS, introduced: 13.0, deprecated: 14.0, message: "This is only to support iOS 13 and replace ProgressView()")
private struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    let color: Color

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView(style: style)
        activity.tintColor = color.uiColor
        return activity
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
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
