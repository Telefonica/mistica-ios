import UIKit

public extension UIView {
    func setMisticaRadius(_ style: CornerRadiusStyle) {
        switch style {
        case .avatar:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.avatar)
        case .bar:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.bar)
        case .button:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.button)
        case .checkbox:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.checkbox)
        case .container:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.container)
        case .indicator:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.indicator)
        case .input:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.input)
        case .legacyDisplay:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.legacyDisplay)
        case .popup:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.popup)
        case .sheet:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.sheet)
        }
    }
    
    private func setMisticaConfigValue(cornerRadiusValue: CornerRadiusValue) {
        if let value = cornerRadiusValue.value {
            layer.cornerRadius = value
        } else if let percentage = cornerRadiusValue.percentage {
            layer.cornerRadius = (min(frame.size.width, frame.size.height) * (percentage/100))
        }
        clipsToBounds = true
    }
}
