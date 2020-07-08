//
//  BoundsChangeInvalidatingFlowLayout.swift
//  Mistica
//
//  Created by Pablo Carcelén on 11/08/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public class BoundsChangeInvalidatingFlowLayout: UICollectionViewFlowLayout {
	private var lastLayoutSize: CGSize?

	// Note that this method will also be called when scrolling as the origin will change
	// Only the size matters to us
	public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		defer { lastLayoutSize = newBounds.size }
		if newBounds.size == lastLayoutSize {
			return super.shouldInvalidateLayout(forBoundsChange: newBounds)
		} else {
			return true
		}
	}

	public override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
		let invalidationContext = super.invalidationContext(forBoundsChange: newBounds)

		if let flowInvalidationContext = invalidationContext as? UICollectionViewFlowLayoutInvalidationContext {
			flowInvalidationContext.invalidateFlowLayoutDelegateMetrics = true
			flowInvalidationContext.invalidateFlowLayoutAttributes = true
		}

		return invalidationContext
	}
}
