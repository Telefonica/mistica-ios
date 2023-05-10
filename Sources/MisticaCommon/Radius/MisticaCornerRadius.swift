import Foundation

public protocol MisticaCornerRadius {
    var avatar: CGFloat { get }
    var bar: CGFloat { get }
    var button: CGFloat { get }
    var checkbox: CGFloat { get }
    var container: CGFloat { get }
    var indicator: CGFloat { get }
    var input: CGFloat { get }
    var legacyDisplay: CGFloat { get }
    var popup: CGFloat { get }
    var sheet: CGFloat { get }
}

struct MovistarCornerRadius: MisticaCornerRadius {
    var avatar: CGFloat = 999
    var bar: CGFloat = 999
    var button: CGFloat = 4
    var checkbox: CGFloat = 2
    var container: CGFloat  = 8
    var indicator: CGFloat = 999
    var input: CGFloat = 8
    var legacyDisplay: CGFloat = 16
    var popup: CGFloat = 8
    var sheet: CGFloat = 8
}

struct O2CornerRadius: MisticaCornerRadius {
    var avatar: CGFloat = 999
    var bar: CGFloat = 999
    var button: CGFloat = 4
    var checkbox: CGFloat = 2
    var container: CGFloat  = 8
    var indicator: CGFloat = 999
    var input: CGFloat = 8
    var legacyDisplay: CGFloat = 16
    var popup: CGFloat = 8
    var sheet: CGFloat = 8
}

struct BlauCornerRadius: MisticaCornerRadius {
    var avatar: CGFloat = 999
    var bar: CGFloat = 999
    var button: CGFloat = 4
    var checkbox: CGFloat = 2
    var container: CGFloat  = 8
    var indicator: CGFloat = 999
    var input: CGFloat = 8
    var legacyDisplay: CGFloat = 16
    var popup: CGFloat = 8
    var sheet: CGFloat = 8
}

struct VivoCornerRadius: MisticaCornerRadius {
    var avatar: CGFloat = 999
    var bar: CGFloat = 999
    var button: CGFloat = 4
    var checkbox: CGFloat = 2
    var container: CGFloat  = 8
    var indicator: CGFloat = 999
    var input: CGFloat = 8
    var legacyDisplay: CGFloat = 16
    var popup: CGFloat = 8
    var sheet: CGFloat = 8
}
