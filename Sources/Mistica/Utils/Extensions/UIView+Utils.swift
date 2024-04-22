//
//  UIView+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
import UIKit

extension UIView {
    static let defaultAnimationDuration: TimeInterval = 0.25

    // MARK: Set MisticaColorStyle

    public func setMisticaColorStyle(_ colorStyle: MisticaColorStyle, ignoreSafeArea: Bool = false) {
        switch colorStyle {
        case .color(let color):
            backgroundColor = color
        case .gradient(let gradient):
            applyLinearGradient(colors: gradient.colors, locations: gradient.stops, angle: gradient.angle, ignoreSafeArea: ignoreSafeArea)
        }
    }

    // MARK: Linear gradient

    public func applyLinearGradient(colors: [UIColor], locations: [CGFloat], angle: CGFloat, ignoreSafeArea: Bool) {
        let gradientView = GradientSwiftUIViewController(colors: colors, stops: locations, angle: angle, ignoreSafeArea: ignoreSafeArea)
        gradientView.view.frame = bounds
        gradientView.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        layer.masksToBounds = true
        addSubview(withDefaultConstraints: gradientView.view)
    }

    // MARK: Blur effect

    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(withDefaultConstraintsIfNeeded: blurEffectView)
    }

    // MARK: Autolayout

    func constraintsForEdges(to view: UIView, inset: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset.bottom),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset.right)
        ]
    }

    // MARK: Geometry

    var frameOrigin: CGPoint {
        get {
            frame.origin
        }
        set {
            frame = CGRect(origin: newValue, size: frame.size).integral
        }
    }

    var frameSize: CGSize {
        get {
            frame.size
        }
        set {
            frame = CGRect(origin: frame.origin, size: newValue).integral
        }
    }

    var frameX: CGFloat {
        get {
            frame.origin.x
        }
        set {
            frame = CGRect(
                origin: CGPoint(x: newValue, y: frame.origin.y),
                size: frame.size
            ).integral
        }
    }

    var frameY: CGFloat {
        get {
            frame.origin.y
        }
        set {
            frame = CGRect(
                origin: CGPoint(x: frame.origin.x, y: newValue),
                size: frame.size
            ).integral
        }
    }

    var frameWidth: CGFloat {
        get {
            frame.width
        }
        set {
            frame = CGRect(
                origin: frame.origin,
                size: CGSize(width: newValue, height: frame.height)
            ).integral
        }
    }

    var frameHeight: CGFloat {
        get {
            frame.height
        }
        set {
            frame = CGRect(
                origin: frame.origin,
                size: CGSize(width: frame.width, height: newValue)
            ).integral
        }
    }

    var frameCenter: CGPoint {
        get {
            center
        }
        set {
            frame = CGRect(
                origin: CGPoint(
                    x: newValue.x - bounds.size.width / 2,
                    y: newValue.y - bounds.size.height / 2
                ),
                size: frame.size
            ).integral
        }
    }

    var boundsOrigin: CGPoint {
        get {
            bounds.origin
        }
        set {
            bounds = CGRect(origin: newValue, size: bounds.size).integral
        }
    }

    var boundsSize: CGSize {
        get {
            bounds.size
        }
        set {
            bounds = CGRect(origin: bounds.origin, size: newValue).integral
        }
    }

    var boundsX: CGFloat {
        get {
            bounds.origin.x
        }
        set {
            bounds = CGRect(
                origin: CGPoint(x: newValue, y: bounds.origin.y),
                size: bounds.size
            ).integral
        }
    }

    var boundsY: CGFloat {
        get {
            bounds.origin.y
        }
        set {
            bounds = CGRect(
                origin: CGPoint(x: bounds.origin.x, y: newValue),
                size: bounds.size
            ).integral
        }
    }

    var boundsWidth: CGFloat {
        get {
            bounds.size.width
        }
        set {
            bounds = CGRect(
                origin: bounds.origin,
                size: CGSize(width: newValue, height: bounds.size.height)
            ).integral
        }
    }

    var boundsHeight: CGFloat {
        get {
            bounds.size.height
        }
        set {
            bounds = CGRect(
                origin: bounds.origin,
                size: CGSize(width: bounds.size.width, height: newValue)
            ).integral
        }
    }

    class func animationOptions(from curve: UIView.AnimationCurve) -> UIView.AnimationOptions {
        switch curve.rawValue {
        case UIView.AnimationCurve.linear.rawValue:
            return .curveLinear
        case UIView.AnimationCurve.easeIn.rawValue:
            return .curveEaseIn
        case UIView.AnimationCurve.easeOut.rawValue:
            return .curveEaseOut
        case UIView.AnimationCurve.easeInOut.rawValue:
            return .curveEaseInOut
        default:
            // Undocumented curves (thanks Apple!)
            return UIView.AnimationOptions(rawValue: UInt(curve.rawValue << 16))
        }
    }

    // MARK: Animations

    func fade(toAlpha alpha: CGFloat, duration: TimeInterval, options: UIView.AnimationOptions = []) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: options,
            animations: { self.alpha = alpha },
            completion: nil
        )
    }

    func lightShake() {
        let earthquakeDuration: CFTimeInterval = 0.05
        let earthquakeRepeatCount: Float = 1
        let earthquakeAnimationMove: CGFloat = 4.0

        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = earthquakeDuration
        animation.repeatCount = earthquakeRepeatCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - earthquakeAnimationMove, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + earthquakeAnimationMove, y: center.y))

        layer.add(animation, forKey: "lightShake")
    }

    func makeRounded() {
        makeRounded(cornerRadius: min(frame.size.width, frame.size.height) / 2)
    }

    func makeRounded(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }

    func removeRounded() {
        layer.cornerRadius = 0.0
    }

    func addBorder(color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
    }

    func removeBorder() {
        layer.borderColor = nil
        layer.borderWidth = 0
    }

    func addSubview(withDefaultConstraintsIfNeeded subview: UIView) {
        if subview.constraints.isEmpty {
            addSubview(subview)
        } else {
            addSubview(withDefaultConstraints: subview)
        }
    }

    func addSubview(_ subview: UIView, constraints: [NSLayoutConstraint]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate(constraints)
    }

    func addSubviewFromNibWithDefaultConstraints() {
        let subview: UIView = type(of: self).internalViewFromNib(owner: self)
        addSubview(subview)
        applyDefaultConstraints(toSubview: subview)
    }

    func addSubview(withDefaultConstraints subview: UIView) {
        addSubview(subview)
        applyDefaultConstraints(toSubview: subview)
    }

    func addSubview(withCenterConstraints subview: UIView) {
        addSubview(subview)
        applyCenterConstraintsTo(toSubview: subview)
    }

    func addSubview(constrainedToLayoutMarginsGuideOf subview: UIView) {
        addSubview(subview)
        applyLayoutMarginsGuideConstraints(toSubview: subview)
    }

    func insertSubview(withDefaultConstraints subview: UIView, at index: Int) {
        insertSubview(subview, at: index)
        applyDefaultConstraints(toSubview: subview)
    }

    func insertSubview(_ subview: UIView, at index: Int, constraints: [NSLayoutConstraint]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(subview, at: index)
        NSLayoutConstraint.activate(constraints)
    }

    class func viewFromNib() -> Self {
        internalViewFromNib()
    }
}

extension UIView {
    class func nib() -> UINib {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".").last!
        let bundle = Bundle(for: self)
        return UINib(nibName: className, bundle: bundle)
    }

    func applyDefaultConstraints(toSubview subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false

        let views: [String: Any] = ["subview": subview]

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview]|", metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview]|", metrics: nil, views: views))
    }

    func applyCenterConstraintsTo(toSubview subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: subview.centerYAnchor),
            centerXAnchor.constraint(equalTo: subview.centerXAnchor)
        ])
    }

    func applyLayoutMarginsGuideConstraints(toSubview subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            layoutMarginsGuide.leadingAnchor.constraint(equalTo: subview.leadingAnchor),
            layoutMarginsGuide.trailingAnchor.constraint(equalTo: subview.trailingAnchor),
            layoutMarginsGuide.topAnchor.constraint(equalTo: subview.topAnchor),
            layoutMarginsGuide.bottomAnchor.constraint(equalTo: subview.bottomAnchor)
        ])
    }

    class func internalViewFromNib<T>(owner: Any? = nil) -> T where T: UIView {
        let nibObjects = nib().instantiate(withOwner: owner, options: nil)
        guard let view = nibObjects.first as? T else {
            fatalError("Nib first element was expected to be \(T.self), found \(String(describing: nibObjects.first.self))")
        }
        return view
    }

    func layoutIfNeededAnimated(withDuration duration: TimeInterval, delay: TimeInterval = 0, options: UIView.AnimationOptions, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: options,
            animations: { [self] in self.layoutIfNeeded() },
            completion: completion
        )
    }

    func hasSuperview(_ superview: UIView) -> Bool {
        viewHasSuperview(self, superview: superview)
    }
}

// MARK: Visual Effect

extension UIView {
    func embedInVisualEffectView(effect: UIVisualEffect) -> UIVisualEffectView {
        let visualEffectView = UIVisualEffectView(effect: effect)

        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.contentView.addSubview(withDefaultConstraints: self)

        return visualEffectView
    }
}

private extension UIView {
    func viewHasSuperview(_ view: UIView, superview: UIView) -> Bool {
        if let sview = view.superview {
            if sview === superview {
                return true
            } else {
                return viewHasSuperview(sview, superview: superview)
            }
        } else {
            return false
        }
    }
}
