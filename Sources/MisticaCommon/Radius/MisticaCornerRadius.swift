import Foundation

public struct CornerRadiusValue {
    var value: CGFloat?
    var percentage: CGFloat?
}

public protocol MisticaCornerRadius {
    var avatar: CornerRadiusValue { get }
    var bar: CornerRadiusValue { get }
    var button: CornerRadiusValue { get }
    var checkbox: CornerRadiusValue { get }
    var container: CornerRadiusValue { get }
    var indicator: CornerRadiusValue { get }
    var input: CornerRadiusValue { get }
    var legacyDisplay: CornerRadiusValue { get }
    var popup: CornerRadiusValue { get }
    var sheet: CornerRadiusValue { get }
}

struct MovistarCornerRadius: MisticaCornerRadius {
    var avatar: CornerRadiusValue = .init(percentage: 50)
    var bar: CornerRadiusValue = .init(value: 999)
    var button: CornerRadiusValue = .init(value: 4)
    var checkbox: CornerRadiusValue = .init(value: 2)
    var container: CornerRadiusValue  = .init(value: 8)
    var indicator: CornerRadiusValue = .init(value: 999)
    var input: CornerRadiusValue = .init(value: 8)
    var legacyDisplay: CornerRadiusValue = .init(value: 16)
    var popup: CornerRadiusValue = .init(value: 8)
    var sheet: CornerRadiusValue = .init(value: 8)
}

struct O2CornerRadius: MisticaCornerRadius {
    var avatar: CornerRadiusValue = .init(percentage: 50)
    var bar: CornerRadiusValue = .init(value: 999)
    var button: CornerRadiusValue = .init(value: 4)
    var checkbox: CornerRadiusValue = .init(value: 2)
    var container: CornerRadiusValue  = .init(value: 8)
    var indicator: CornerRadiusValue = .init(value: 999)
    var input: CornerRadiusValue = .init(value: 8)
    var legacyDisplay: CornerRadiusValue = .init(value: 16)
    var popup: CornerRadiusValue = .init(value: 8)
    var sheet: CornerRadiusValue = .init(value: 8)
}

struct BlauCornerRadius: MisticaCornerRadius {
    var avatar: CornerRadiusValue = .init(percentage: 50)
    var bar: CornerRadiusValue = .init(value: 999)
    var button: CornerRadiusValue = .init(value: 4)
    var checkbox: CornerRadiusValue = .init(value: 2)
    var container: CornerRadiusValue  = .init(value: 8)
    var indicator: CornerRadiusValue = .init(value: 999)
    var input: CornerRadiusValue = .init(value: 8)
    var legacyDisplay: CornerRadiusValue = .init(value: 16)
    var popup: CornerRadiusValue = .init(value: 8)
    var sheet: CornerRadiusValue = .init(value: 8)
}

struct VivoCornerRadius: MisticaCornerRadius {
    var avatar: CornerRadiusValue = .init(percentage: 50)
    var bar: CornerRadiusValue = .init(value: 999)
    var button: CornerRadiusValue = .init(value: 4)
    var checkbox: CornerRadiusValue = .init(value: 2)
    var container: CornerRadiusValue  = .init(value: 8)
    var indicator: CornerRadiusValue = .init(value: 999)
    var input: CornerRadiusValue = .init(value: 8)
    var legacyDisplay: CornerRadiusValue = .init(value: 16)
    var popup: CornerRadiusValue = .init(value: 8)
    var sheet: CornerRadiusValue = .init(value: 8)
}
