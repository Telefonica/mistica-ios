//
//  ColorsView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Mistica
import MisticaSwiftUI
import SwiftUI

struct ColorsView: View {
    @State var searchText = ""

    var body: some View {
        List {
            ForEach(colors, id: \.name) { item in
                Cell(
                    style: .fullwidth,
                    title: item.name,
                    subtitle: item.paletteName,
                    description: item.color.hexString.uppercased(),
                    assetType: .largeIcon(
                        Image(systemName: "circle.fill")
                            .resizable(),
                        foregroundColor: Color(item.color)
                    )
                )
            }
        }
        .misticaListStyle()
        .modifier(Searchable(text: $searchText))
    }

    var paletteColors: Any {
        switch MisticaConfig.brandStyle {
        case .movistar:
            return MovistarColorPalette()
        case .blau:
            return BlauColorPalette()
        case .o2:
            return O2ColorPalette()
        case .o2Classic:
            return O2ClassicColorPalette()
        case .vivo:
            return VivoColorPalette()
        case .custom(let colors, _):
            return colors
        }
    }

    var colors: [(name: String, paletteName: String?, color: UIColor)] {
        let misticaColorsByName = ColorInspector(value: MisticaConfig.currentColors).colorsByName
        let paletteColorsByName = ColorInspector(value: paletteColors).colorsByName

        return misticaColorsByName
            .map { name, color in
                let paletteName = paletteColorsByName.first { $0.value.hexString == color.hexString }?.key
                return (name: name, paletteName: paletteName, color: color)
            }
            .sorted { lItem, rItem in lItem.name < rItem.name }
            .filter { element in
                guard !searchText.isEmpty else { return true }
                let name = element.name.lowercased()
                let paletteName = (element.paletteName ?? "").lowercased()
                let hex = element.color.hexString.lowercased()
                let searchText = searchText.lowercased()
                return name.contains(searchText) || paletteName.contains(searchText) || hex.contains(searchText)
            }
    }
}

// MARK: Helpers

struct Searchable: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .searchable(text: $text)
        } else {
            content
        }
    }
}

extension UIColor {
    var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0

        return String(format: "#%06x", rgb)
    }
}

struct ColorInspector {
    let value: Any

    var colorsByName: [String: UIColor] {
        var result: [String: UIColor] = [:]

        let mirror = Mirror(reflecting: value)

        for (property, value) in mirror.children {
            guard let property = property else {
                continue
            }

            guard let color = value as? UIColor else {
                continue
            }

            result[property] = color
        }

        return result
    }
}
