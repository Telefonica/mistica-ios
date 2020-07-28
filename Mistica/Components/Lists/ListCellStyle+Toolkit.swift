//
//  ListCellStyle+Toolkit.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 25/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public enum ListCellStyle {
    case fullWidth
    case boxed
}

extension ListCellStyle {
    var cornerRadius: CGFloat {
        switch self {
        case .fullWidth:
            return 0
        case .boxed:
            return 4
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .fullWidth:
            return 0
        case .boxed:
            return 1
        }
    }

    var borderColor: CGColor? {
        switch self {
        case .fullWidth:
            return nil
        case .boxed:
            return UIColor.border.cgColor
        }
    }

    var cellSeparatorIsHidden: Bool {
        switch self {
        case .fullWidth:
            return false
        case .boxed:
            return true
        }
    }

    var minHeight: CGFloat {
        switch self {
        case .fullWidth:
            return 72.0
        case .boxed:
            return 92.0
        }
    }

    var contentViewLayoutMargins: NSDirectionalEdgeInsets {
        switch self {
        case .fullWidth:
            return .zero
        case .boxed:
            return NSDirectionalEdgeInsets(top: 8,
                                           leading: 16,
                                           bottom: 8,
                                           trailing: 16)
        }
    }

    var mainStackViewLayoutMargins: NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: 16,
                                leading: 16,
                                bottom: 16,
                                trailing: 16)
    }
}
