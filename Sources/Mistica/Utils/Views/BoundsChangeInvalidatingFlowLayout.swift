//
//  BoundsChangeInvalidatingFlowLayout.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

class BoundsChangeInvalidatingFlowLayout: UICollectionViewFlowLayout {
    private var lastLayoutSize: CGSize?

    // Note that this method will also be called when scrolling as the origin will change
    // Only the size matters to us
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        defer { lastLayoutSize = newBounds.size }
        if newBounds.size == lastLayoutSize {
            return super.shouldInvalidateLayout(forBoundsChange: newBounds)
        } else {
            return true
        }
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let invalidationContext = super.invalidationContext(forBoundsChange: newBounds)

        if let flowInvalidationContext = invalidationContext as? UICollectionViewFlowLayoutInvalidationContext {
            flowInvalidationContext.invalidateFlowLayoutDelegateMetrics = true
            flowInvalidationContext.invalidateFlowLayoutAttributes = true
        }

        return invalidationContext
    }
}
