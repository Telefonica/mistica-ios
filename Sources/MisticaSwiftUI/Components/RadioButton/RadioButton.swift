//
//  RadioButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct RadioButton: View {
    @Binding var isSelected: Bool

    public init(isSelected: Binding<Bool>) {
        _isSelected = isSelected
    }

    public var body: some View {
        Circle()
            .strokeBorder(controlColor, lineWidth: lineWidth)
            .frame(width: 24, height: 24)
            .animation(.misticaTimingCurve, value: isSelected)
            .onTapGesture {
                isSelected.toggle()
            }
    }

    var controlColor: Color {
        isSelected ? .controlActivated : .control
    }

    var lineWidth: CGFloat {
        isSelected ? 6 : 2
    }
}

#if DEBUG
    struct RadioButton_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                RadioButton(isSelected: .constant(true))
                RadioButton(isSelected: .constant(false))
            }
        }
    }
#endif
