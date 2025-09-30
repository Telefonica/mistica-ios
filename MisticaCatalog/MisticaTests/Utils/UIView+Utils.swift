//
//  UIView+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

extension UIView {
    class func viewFromNib() -> Self {
        internalViewFromNib()
    }

    private class func nib() -> UINib {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".").last!
        #if SWIFT_PACKAGE
            let bundle = Bundle.module
        #else
            let bundle = Bundle(for: self)
        #endif
        return UINib(nibName: className, bundle: bundle)
    }

    private class func internalViewFromNib<T>(owner: Any? = nil) -> T where T: UIView {
        let nibObjects = nib().instantiate(withOwner: owner, options: nil)
        guard let view = nibObjects.first as? T else {
            fatalError("Nib first element was expected to be \(T.self), found \(String(describing: nibObjects.first.self))")
        }
        return view
    }
}
