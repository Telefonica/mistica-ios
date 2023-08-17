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
        Rectangle()
            .fill(fillColor)
            .border(radiusStyle: .checkbox, borderColor: borderColor, lineWidth: 1)
            .frame(width: 24, height: 24)
            .overlay(checkImage)
            .animation(.misticaTimingCurve, value: isSelected)
            .onTapGesture {
                isSelected.toggle()
            }
    }

    var fillColor: Color {
        isSelected ? .controlActivated : .background
    }

    var borderColor: Color {
        isSelected ? .controlActivated : .control
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
