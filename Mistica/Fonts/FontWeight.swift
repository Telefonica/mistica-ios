//
//  FontWeight.swift
//  Mistica
//
//  Created by jalonso on 10/09/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

protocol FontWeightConvertible {
    var weight: UIFont.Weight { get }
}

extension FontStyle {
    @objc public enum TextPreset1Weight: Int, FontWeightConvertible {
        case light
        
        var weight: UIFont.Weight { .light }
    }

    @objc public enum TextPreset2Weight: Int, FontWeightConvertible {
        case light
        
        var weight: UIFont.Weight { .light }
    }

    @objc public enum TextPreset3Weight: Int, FontWeightConvertible {
        case light
        
        var weight: UIFont.Weight { .light }
    }

    @objc public enum TextPreset4Weight: Int, FontWeightConvertible {
        case light
        
        var weight: UIFont.Weight { .light }
    }

    @objc public enum TextPreset5Weight: Int, FontWeightConvertible {
        case light, medium
        
        var weight: UIFont.Weight {
            switch self {
            case .light: return .light
            case .medium: return .medium
            }
        }
    }

    @objc public enum TextPreset6Weight: Int, FontWeightConvertible {
        case regular, medium
        
        var weight: UIFont.Weight {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    @objc public enum TextPreset7Weight: Int, FontWeightConvertible {
        case regular, medium
        
        var weight: UIFont.Weight {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    @objc public enum TextPreset8Weight: Int, FontWeightConvertible {
        case regular, medium
        
        var weight: UIFont.Weight {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    @objc public enum TextSystemWeight: Int, FontWeightConvertible {
        case regular
        
        var weight: UIFont.Weight { .regular }
    }
}
