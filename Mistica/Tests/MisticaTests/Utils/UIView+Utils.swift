//
//  UIView+Utils.swift
//  MisticaTests
//
//  Created by Jose Miguel Brocal on 25/11/20.
//

import UIKit

extension UIView {
    class func viewFromNib() -> Self {
        internalViewFromNib()
    }
    
    private class func nib() -> UINib {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".").last!
        let bundle = Bundle(for: self)
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
