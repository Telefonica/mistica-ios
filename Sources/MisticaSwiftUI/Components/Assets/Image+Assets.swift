import SwiftUI
import Shared

@available(iOS 13.0, *)
extension Image {
    static let arrowRight = Image(uiImage: .arrowRight)
    static let iconNotificationInfo = Image(uiImage: UIImage.iconNotificationInfo!)
    static let checkboxCheck = Image(uiImage: UIImage.checkmarkIcon)
    static let close = Image(uiImage: UIImage.closeButtonBlackSmallIcon)

    static let eyeDisabled = Image(uiImage: UIImage.eyeDisabled)
    static let eyeEnabled = Image(uiImage: UIImage.eyeEnabled)
    static let search = Image(uiImage: UIImage.search)
    static let calendar = Image(uiImage: UIImage.calendar)
    static let dropdown = Image(uiImage: UIImage.arrowDown)
}
