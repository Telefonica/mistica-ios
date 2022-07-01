import Foundation
import SwiftUI
import Shared

public enum SnackbarStyle {
    case normal
    case error
}

public enum SnackbarPresentationMode {
    case normal
    case crouton
}

public enum SnackbarButtonStyle {
    case large
    case short
}

@available(iOS 13.0, *)
public struct Snackbar<Button: View>: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets

    private var style: SnackbarStyle = .normal
    private var presentationMode: SnackbarPresentationMode = .normal
    private var buttonStyle: SnackbarButtonStyle = .short
    private var title: String
    private var button: Button?

    private var buttonAccessibilityLabel: String?
    private var buttonAccessibilityIdentifier: String?
    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?

    public init(
        title: String,
        @ViewBuilder button: () -> Button
    ) {
        self.title = title
        self.button = button()
    }

    public var body: some View {
        stack {
            Text(title)
                .font(.textPreset2(weight: .regular))
                .foregroundColor(.textPrimaryInverse)
                .accessibilityLabel(titleAccessibilityLabel)
                .accessibilityIdentifier(titleAccessibilityIdentifier)
                .expandHorizontally(alignment: .leading)

            alignedButton
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .applying { content in
            switch presentationMode {
            case .normal:
                content
                    .background(backgroundColor)
                    .round(cornerRadius: 4)
                    .padding(8)

            case .crouton:
                content
                    .padding(.bottom, safeAreaInsets.bottom)
                    .background(backgroundColor)
            }
        }
    }
}

// MARK: Private

@available(iOS 13.0, *)
private extension Snackbar {
    @ViewBuilder
    func stack<T: View>(@ViewBuilder content: () -> T) -> some View {
        switch buttonStyle {
        case .large:
            VStack(alignment: .trailing, spacing: 18, content: content)
        case .short:
            HStack(spacing: 16, content: content)
        }
    }

    @ViewBuilder
    var alignedButton: some View {
        switch buttonStyle {
        case .large:
            if let button = button {
                button
                    .accessibilityLabel(buttonAccessibilityLabel)
                    .accessibilityIdentifier(buttonAccessibilityIdentifier)
                    .buttonStyle(misticaButtonStyle)
            }
        case .short:
            if let button = button {
                Spacer()
                button
                    .accessibilityLabel(buttonAccessibilityLabel)
                    .accessibilityIdentifier(buttonAccessibilityIdentifier)
                    .buttonStyle(misticaButtonStyle)
            }
        }
    }

    var misticaButtonStyle: MisticaButtonStyle {
        style == .normal
            ? .misticaLink(small: true, bleedingAlignment: .trailing)
            : .misticaLinkInverse(small: true, bleedingAlignment: .trailing)
    }

    var backgroundColor: Color {
        style == .normal ? .feedbackInfoBackground : .feedbackErrorBackground
    }
}

// MARK: Modifiers

@available(iOS 13.0, *)
public extension Snackbar {
    func style(_ style: SnackbarStyle) -> Snackbar {
        var view = self
        view.style = style
        return view
    }

    func presentationMode(_ presentationMode: SnackbarPresentationMode) -> Snackbar {
        var view = self
        view.presentationMode = presentationMode
        return view
    }

    func buttonStyle(_ buttonStyle: SnackbarButtonStyle) -> Snackbar {
        var view = self
        view.buttonStyle = buttonStyle
        return view
    }

    func buttonAccessibilityLabel(_ buttonAccessibilityLabel: String?) -> Snackbar {
        var snackbar = self
        snackbar.buttonAccessibilityLabel = buttonAccessibilityLabel
        return snackbar
    }

    func buttonAccessibilityIdentifier(_ buttonAccessibilityIdentifier: String?) -> Snackbar {
        var snackbar = self
        snackbar.buttonAccessibilityIdentifier = buttonAccessibilityIdentifier
        return snackbar
    }

    func titleAccessibilityLabel(_ titleAccessibilityLabel: String?) -> Snackbar {
        var snackbar = self
        snackbar.titleAccessibilityLabel = titleAccessibilityLabel
        return snackbar
    }

    func titleAccessibilityIdentifier(_ titleAccessibilityIdentifier: String?) -> Snackbar {
        var snackbar = self
        snackbar.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        return snackbar
    }
}
