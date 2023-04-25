//
//  FontsView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct FontView: View {
    let fonts: [(name: String, font: Font)] = [
        ("text-preset10", .textPreset10()),
        ("text-preset9", .textPreset9()),
        ("text-preset8", .textPreset8()),
        ("text-preset7", .textPreset7()),
        ("text-preset6", .textPreset6()),
        ("text-preset5", .textPreset5()),
        ("text-preset4 medium", .textPreset4(weight: .medium)),
        ("text-preset4 regular", .textPreset4(weight: .regular)),
        ("text-preset4 light", .textPreset4(weight: .light)),
        ("text-preset3 medium", .textPreset3(weight: .medium)),
        ("text-preset3 regular", .textPreset3(weight: .regular)),
        ("text-preset3 light", .textPreset3(weight: .light)),
        ("text-preset2 medium", .textPreset2(weight: .medium)),
        ("text-preset2 regular", .textPreset2(weight: .regular)),
        ("text-preset1 medium", .textPreset1(weight: .medium)),
        ("text-preset1 regular", .textPreset1(weight: .regular))
    ]

    var body: some View {
        List {
            ForEach(fonts, id: \.name) { item in
                VStack(alignment: .leading, spacing: 16) {
                    Text(item.name)
                        .font(.textPreset1(weight: .regular))
                        .foregroundColor(.textSecondary)

                    Text("A wizard's job is to vex chumps quickly in fog.")
                        .font(item.font)
                        .foregroundColor(.textPrimary)
                }
                .expandHorizontally(alignment: .leading)
                .padding()
                .overlay(Divider().padding(.horizontal, 16), alignment: .bottom)
                .listSeparatorHidden()
                .background(Color.background)
            }
        }
        .misticaListStyle()
    }
}
