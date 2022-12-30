//
//  Checkbox.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct Checkbox: View {
    @Binding var isSelected: Bool

    public init(isSelected: Binding<Bool>) {
        _isSelected = isSelected
    }

    public var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .strokeBorder(controlColor, lineWidth: lineWidth)
            .frame(width: 24, height: 24)
            .overlay(checkImage)
            .animation(.misticaTimingCurve, value: isSelected)
            .onTapGesture {
                isSelected.toggle()
            }
    }

    var controlColor: Color {
        isSelected ? .controlActivated : .control
    }

    var lineWidth: CGFloat {
        isSelected ? 24 : 1
    }

    var imageScale: CGFloat {
        isSelected ? 1 : 0.01
    }

    @ViewBuilder
    var checkImage: some View {
        Image.checkmarkIcon
            .resizable()
            .frame(width: 10, height: 10)
            .scaleEffect(imageScale)
    }
}

#if DEBUG
    struct Checkbox_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                Checkbox(isSelected: .constant(true))
                Checkbox(isSelected: .constant(false))
            }
        }
    }
#endif
