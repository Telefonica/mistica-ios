import SwiftUI

public extension View {
    func round(radiusStyle: CornerRadiusStyle) -> some View {
        clipShape(RoundedRectangle(cornerRadius: getMisticaConfigValue(radiusStyle, height: 0), style: .continuous))
    }
    
    func border(radiusStyle: CornerRadiusStyle, borderColor: Color = .border, lineWidth: CGFloat = 1) -> some View {
        GeometryReader { geo in
            clipShape(RoundedRectangle(cornerRadius: getMisticaConfigValue(radiusStyle, height: geo.size.height), style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: getMisticaConfigValue(radiusStyle, height: geo.size.height), style: .continuous).stroke(borderColor, lineWidth: lineWidth))
            .frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
        }
    }
    
    private func getMisticaConfigValue(_ radiusStyle: CornerRadiusStyle, height: CGFloat) -> CGFloat {
        switch radiusStyle {
        case .avatar:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.avatar, height: height)
        case .bar:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.bar, height: height)
        case .button:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.button, height: height)
        case .checkbox:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.checkbox, height: height)
        case .container:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.container, height: height)
        case .indicator:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.indicator, height: height)
        case .input:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.input, height: height)
        case .legacyDisplay:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.legacyDisplay, height: height)
        case .popup:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.popup, height: height)
        case .sheet:
            return getMisticaCornerRadiusValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.sheet, height: height)
        }
    }
    
    private func getMisticaCornerRadiusValue(cornerRadiusValue: CornerRadiusValue, height: CGFloat) -> CGFloat {
        if let value = cornerRadiusValue.value {
            return value
        } else if let percentage = cornerRadiusValue.percentage {
            return height * (percentage/100)
        } else {
            return .zero
        }
    }
}
