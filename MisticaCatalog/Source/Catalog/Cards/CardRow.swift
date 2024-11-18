//
//  CardRow.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaCommon
import UIKit

enum CardRow: Int, CaseIterable, Identifiable {
    case dataCard
    case posterCard
    case snapCard

    var id: Int {
        rawValue
    }
}

extension CardRow {
    var title: String {
        switch self {
        case .dataCard: "Data Card"
        case .posterCard: "Poster Card"
        case .snapCard: "Snap Card"
        }
    }

    var icon: UIImage {
        switch self {
        case .dataCard: .cardIcon
        case .posterCard: .cardIcon
        case .snapCard: .cardIcon
        }
    }
}
