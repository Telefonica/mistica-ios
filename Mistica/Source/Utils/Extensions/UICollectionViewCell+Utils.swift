//
//  UICollectionViewCell+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    class func registerClassForCell(to collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: cellReuseIdentifier())
    }

    class func registerNibForCell(to collectionView: UICollectionView) {
        collectionView.register(nib(), forCellWithReuseIdentifier: cellReuseIdentifier())
    }

    class func dequeueReusableCell(for indexPath: IndexPath, from collectionView: UICollectionView) -> Self {
        internalDequeueReusableCell(for: indexPath, from: collectionView)
    }
}

extension UICollectionViewCell {
    class func cellReuseIdentifier() -> String {
        NSStringFromClass(self).components(separatedBy: ".").last!
    }

    class func internalDequeueReusableCell<T>(for indexPath: IndexPath, from collectionView: UICollectionView) -> T where T: UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier(), for: indexPath) as? T else {
            fatalError("Nib cell class does not match expected cell class \(cellReuseIdentifier()).")
        }

        return cell
    }
}
