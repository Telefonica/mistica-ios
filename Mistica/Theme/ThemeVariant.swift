//
//  ThemeToolkit.swift
//  CommonUIKit
//
//  Created by Pablo Bartolome on 7/19/19.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public enum ThemeVariant: String, CaseIterable {
	case standard
	case prominent
}

public class ThemeToolkit {
	public private(set) static var currentVariant: ThemeVariant = .standard

	public static func configure(with variant: ThemeVariant) {
		currentVariant = variant
	}
}
