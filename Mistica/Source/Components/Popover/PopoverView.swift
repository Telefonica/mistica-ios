//
//  PopoverView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import CoreGraphics
import UIKit

// MARK: ViewStyles

private enum ViewStyles {
    static let tipSize = CGSize(width: 12, height: 7)
    static let gapBetweenTipAndTargetView = CGFloat(2)
    static let cornerRadius = CGFloat(8)
    static let shadowOpacity = Float(0.3)
    static let shadowOffset = CGSize(width: 0, height: 3)
    static let horizontalPadding = CGFloat(16)
    static let gapBetweenTipAndTarget = CGFloat(2)
    static let animationAppearanceOffset = CGFloat(5)
    static let leadingMarginToContainerView = CGFloat(16)
    static let trailingMarginToContainerView = CGFloat(16)
}

// MARK: PopoverView

public class PopoverView: UIView {
    @frozen
    public enum TipDirection {
        case up
        case down
    }

    private lazy var contentView = PopoverContentView { [weak self] in
        guard let s = self else { return }

        s.onCloseButtonAction?()
        s.dismiss(animated: s.animated)
    }

    private var containerView: UIView!
    private var targetView: UIView!

    private var tipDirection = TipDirection.up
    private var animated = true

    public var onCloseButtonAction: (() -> Void)?
    public var onTapAction: (() -> Void)?

    public init() {
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func draw(_: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()

        let tipPoint = updateArrowTipPoint()
        drawBubble(contentView.frame, tipDirection: tipDirection, tipPoint: tipPoint, context: context)
        drawShadow()

        context.restoreGState()
    }
}

// MARK: Public

public extension PopoverView {
    class func show(tipDirection: TipDirection,
                    title: String?,
                    subtitle: String? = nil,
                    pointingAtView targetView: UIView,
                    in containerView: UIView,
                    animated: Bool) {
        let configuration = PopoverConfiguration(tipDirection: tipDirection, image: nil, title: title, subtitle: subtitle, canClose: true)
        show(configuration: configuration, pointingAtView: targetView, in: containerView, animated: animated)
    }

    class func show(configuration: PopoverConfiguration, pointingAtView targetView: UIView, in containerView: UIView, animated: Bool) {
        let popoverView = PopoverView()
        popoverView.show(configuration: configuration, pointingAtView: targetView, in: containerView, animated: animated)
    }

    func show(configuration: PopoverConfiguration, pointingAtView targetView: UIView, in containerView: UIView, animated: Bool) {
        precondition(targetView.hasSuperview(containerView), "The supplied containerView <\(containerView)> is not a direct nor an indirect superview of the supplied reference view <\(targetView)>. The containerView passed to this method should be a direct or an indirect superview of the target view.")

        if containerView.isKind(of: UIScrollView.self) {
            // When the container view is a ScrollView, the popover can't be sized based
            // on the scroll view's width. Use the parent view instead.
            guard let superView = containerView.superview else {
                fatalError("Popover can't be added to a ScrollView that doesn't have a superview.")
            }
            self.containerView = superView
        } else {
            self.containerView = containerView
        }

        self.targetView = targetView
        self.animated = animated
        tipDirection = configuration.tipDirection

        configure(with: configuration)
        setUpConstraints()

        show(animated: animated)
    }

    func dismiss(animated: Bool) {
        let completion: (Bool) -> Void = { finished in
            if finished {
                self.removeFromSuperview()
            }
        }

        if animated {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                self.alpha = 0.0
                self.transform = CGAffineTransform(translationX: 0, y: self.initialAppearanceYOffset())
            }, completion: completion)
        } else {
            completion(true)
        }
    }
}

// MARK: Custom Accessibilities

public extension PopoverView {
    var closeButtonAccessibilityLabel: String? {
        get {
            contentView.closeButtonAccessibilityLabel
        }
        set {
            contentView.closeButtonAccessibilityLabel = newValue
        }
    }

    var closeButtonAccessibilityIdentifier: String? {
        get {
            contentView.closeButtonAccessibilityIdentifier
        }
        set {
            contentView.closeButtonAccessibilityIdentifier = newValue
        }
    }

    var imageAccessibilityLabel: String? {
        get {
            contentView.imageAccessibilityLabel
        }
        set {
            contentView.imageAccessibilityLabel = newValue
        }
    }

    var imageAccessibilityIdentifier: String? {
        get {
            contentView.imageAccessibilityIdentifier
        }
        set {
            contentView.imageAccessibilityIdentifier = newValue
        }
    }

    var titleAccessibilityLabel: String? {
        get {
            contentView.titleAccessibilityLabel
        }
        set {
            contentView.titleAccessibilityLabel = newValue
        }
    }

    var titleAccessibilityIdentifier: String? {
        get {
            contentView.titleAccessibilityIdentifier
        }
        set {
            contentView.titleAccessibilityIdentifier = newValue
        }
    }

    var subtitleAccessibilityLabel: String? {
        get {
            contentView.subtitleAccessibilityLabel
        }
        set {
            contentView.subtitleAccessibilityLabel = newValue
        }
    }

    var subtitleAccessibilityIdentifier: String? {
        get {
            contentView.subtitleAccessibilityIdentifier
        }
        set {
            contentView.subtitleAccessibilityIdentifier = newValue
        }
    }
}

// MARK: Private

private extension PopoverView {
    func commonInit() {
        backgroundColor = .clear
        alpha = 0.0

        addSubview(contentView)

        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(popoverTapped))

        addGestureRecognizer(tapGesture)
    }

    @objc func popoverTapped() {
        onTapAction?()
    }

    func configure(with configuration: PopoverConfiguration) {
        contentView.image = configuration.image
        contentView.title = configuration.title
        contentView.subtitle = configuration.subtitle
        contentView.canClose = configuration.canClose
    }

    func setUpConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(self)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        // Set the center X of the popover equal to the center X of the targetted view, but this constraint
        // has a lower priority for maintaninng the popover always visible in container view
        let centerX = centerXAnchor.constraint(equalTo: targetView.centerXAnchor)
        centerX.priority = .defaultLow
        centerX.isActive = true

        NSLayoutConstraint.activate([
            // Maximum width is container width minus the margin
            widthAnchor.constraint(lessThanOrEqualTo: containerView.widthAnchor, constant: -(ViewStyles.leadingMarginToContainerView + ViewStyles.trailingMarginToContainerView)),
            heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: ViewStyles.tipSize.height),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),

            // Keep the popover respecting the margin with containerView
            leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: ViewStyles.leadingMarginToContainerView),
            trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -ViewStyles.trailingMarginToContainerView)
        ])

        switch tipDirection {
        case .up:
            topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: ViewStyles.gapBetweenTipAndTargetView).isActive = true
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: ViewStyles.tipSize.height).isActive = true
        case .down:
            bottomAnchor.constraint(equalTo: targetView.topAnchor, constant: -ViewStyles.gapBetweenTipAndTargetView).isActive = true
            contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        }
    }

    func show(animated: Bool) {
        transform = CGAffineTransform(translationX: 0, y: initialAppearanceYOffset())

        let animation = {
            self.alpha = 1.0
            self.transform = .identity
        }

        if animated {
            UIView.animate(withDuration: 0.2, animations: animation)
        } else {
            animation()
        }
    }

    func initialAppearanceYOffset() -> CGFloat {
        tipDirection == .up ? ViewStyles.animationAppearanceOffset : -ViewStyles.animationAppearanceOffset
    }

    func updateArrowTipPoint() -> CGPoint {
        let refViewFrame = targetView.convert(targetView.bounds, to: containerView)

        var arrowTipXOrigin: CGFloat
        var tipYOrigin: CGFloat

        if frame.width < refViewFrame.width {
            arrowTipXOrigin = frame.width / 2
        } else if refViewFrame.minX < ViewStyles.leadingMarginToContainerView {
            arrowTipXOrigin = ViewStyles.cornerRadius + ViewStyles.tipSize.width / 2
        } else {
            arrowTipXOrigin = abs(frame.minX - refViewFrame.minX) + refViewFrame.width / 2
        }

        switch tipDirection {
        case .down:
            tipYOrigin = frame.height
        case .up:
            tipYOrigin = 0
        }

        return CGPoint(x: arrowTipXOrigin, y: tipYOrigin)
    }

    func drawShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = ViewStyles.shadowOffset
        layer.shadowRadius = ViewStyles.cornerRadius
        layer.shadowOpacity = ViewStyles.shadowOpacity
    }

    func drawBubble(_ bubbleFrame: CGRect, tipDirection: TipDirection, tipPoint: CGPoint, context: CGContext) {
        let arrowWidth = ViewStyles.tipSize.width
        let arrowHeight = ViewStyles.tipSize.height
        let cornerRadius = ViewStyles.cornerRadius

        let contourPath = CGMutablePath()

        contourPath.move(to: CGPoint(x: tipPoint.x, y: tipPoint.y))

        switch tipDirection {
        case .down:
            contourPath.addLine(to: CGPoint(x: tipPoint.x - arrowWidth / 2, y: tipPoint.y + -1 * arrowHeight))
            drawBubbleBottomShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            contourPath.addLine(to: CGPoint(x: tipPoint.x + arrowWidth / 2, y: tipPoint.y + -1 * arrowHeight))
        case .up:
            contourPath.addLine(to: CGPoint(x: tipPoint.x - arrowWidth / 2, y: tipPoint.y + 1 * arrowHeight))
            drawBubbleTopShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            contourPath.addLine(to: CGPoint(x: tipPoint.x + arrowWidth / 2, y: tipPoint.y + 1 * arrowHeight))
        }

        contourPath.closeSubpath()
        context.addPath(contourPath)
        context.clip()

        paintBubble(context)
    }

    func drawBubbleBottomShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        path.addArc(tangent1End: CGPoint(x: frame.minX, y: frame.minY + frame.height), tangent2End: CGPoint(x: frame.minX, y: frame.minY), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.minX, y: frame.minY), tangent2End: CGPoint(x: frame.minX + frame.width, y: frame.minY), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.minX + frame.width, y: frame.minY), tangent2End: CGPoint(x: frame.minX + frame.width, y: frame.minY + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.minX + frame.width, y: frame.minY + frame.height), tangent2End: CGPoint(x: frame.minX, y: frame.minY + frame.height), radius: cornerRadius)
    }

    func drawBubbleTopShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        path.addArc(tangent1End: CGPoint(x: frame.minX, y: frame.minY), tangent2End: CGPoint(x: frame.minX, y: frame.minY + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.minX, y: frame.minY + frame.height), tangent2End: CGPoint(x: frame.minX + frame.width, y: frame.minY + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.minX + frame.width, y: frame.minY + frame.height), tangent2End: CGPoint(x: frame.minX + frame.width, y: frame.minY), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.minX + frame.width, y: frame.minY), tangent2End: CGPoint(x: frame.minX, y: frame.minY), radius: cornerRadius)
    }

    func paintBubble(_ context: CGContext) {
        context.setFillColor(UIColor.background.cgColor)
        context.fill(bounds)
    }
}
