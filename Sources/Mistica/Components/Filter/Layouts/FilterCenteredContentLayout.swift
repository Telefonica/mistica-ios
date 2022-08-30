//
//  FilterCenteredContentLayout.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// This custom layout allows us to render the cells centered on the screen when the contentSize is less than the
/// available space in the collection view.
///
/// The most obvious approach for this is to wait for `layoutSubviews()`, delegate on super, then change the
/// contentInsets. The problem with this approach is that setting the contentInsets invalidates the layout, so that's a
/// dead end.
///
/// The trick we use here is to delegate the layout calculations on super, so all the auto sizing magic will happen, and
/// then we take every produced attribute and offset it by half of the remainder space.
///
/// This layout inherits from `BoundsChangeInvalidatingFlowLayout`, which will invalidate layout only when `bounds.size`
/// changes.
class FilterCenteredContentLayout: BoundsChangeInvalidatingFlowLayout {
    // Override the contentSize because we are also overriding layoutAttributesForElements, and there we are adding a
    // padding to the left of every attribute, which we need to take in account when calculating the contentSize.
    // Otherwise the rightmost cells might even get deallocated, since the UICollectionView might consider them not
    // visible, and thus reciclable.
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else { return super.collectionViewContentSize }

        let inheritedContentSize = super.collectionViewContentSize
        let contentWidth = inheritedContentSize.width
        let availableHorizontalSpace = collectionView.boundsWidth - totalHorizontalInsets
        if contentWidth < availableHorizontalSpace {
            let totalPadding = (availableHorizontalSpace - contentWidth)
            return CGSize(width: contentWidth + totalPadding, height: inheritedContentSize.height)
        } else {
            return inheritedContentSize
        }
    }

    // The trick used to center cells is to let super to do the attributes calculation for us using AutoLayout. Then
    // take these attributes and push them to the right by a factor which is calculated as half of the difference
    // between the available space and the contentWidth
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let allAttributes = super.layoutAttributesForElements(in: rect) else { return [] }
        guard let collectionView = collectionView else { return allAttributes }

        let rightmostElementAttributes = allAttributes.max { $0.frame.maxX < $1.frame.maxX }
        guard let totalMaxX = rightmostElementAttributes?.frame.maxX else { return allAttributes }
        let contentWidth = totalMaxX

        let availableHorizontalSpace = collectionView.boundsWidth - totalHorizontalInsets
        if contentWidth < availableHorizontalSpace {
            let rightPadding = (availableHorizontalSpace - contentWidth) / 2
            allAttributes.forEach { attributes in
                attributes.frame.origin.x += rightPadding
            }
        }

        return allAttributes
    }
}

private extension FilterCenteredContentLayout {
    var totalHorizontalInsets: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.adjustedContentInset.left + collectionView.adjustedContentInset.right
    }
}
