//
//  SkeletonView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public enum SkeletonType {
    case line(width: CGFloat)
    case text(numberOfLines: Int = 3)
    case circle(size: CGFloat)
    case row
    case rectangle(size: CGSize, isRounded: Bool)
}

public class Skeleton: UIView {
    enum Constants {
        static let lineHeight: CGFloat = 8.0
        static let rectangleRadius: CGFloat = MisticaConfig.currentCornerRadius.container
        static let spacing: CGFloat = 18.0
        static let circleSize: CGFloat = 40.0
        static let rowSkeletonHeight: CGFloat = 50.0

        static var circleRadius: CGFloat { circleSize / 2 }
    }

    public var type: SkeletonType

    public init(type: SkeletonType) {
        self.type = type
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        switch type {
        case .line(let width):
            let skeletonView = createSkeletonView(size: CGSize(width: width, height: Constants.lineHeight), cornerRadius: Constants.lineHeight / 2)
            addSubview(skeletonView)
            skeletonView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                skeletonView.topAnchor.constraint(equalTo: topAnchor),
                skeletonView.leadingAnchor.constraint(equalTo: leadingAnchor),
                skeletonView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                skeletonView.bottomAnchor.constraint(equalTo: bottomAnchor),
                skeletonView.heightAnchor.constraint(equalToConstant: Constants.lineHeight)
            ])
        case .text(let numberOfLines):
            setupTextSkeleton(numberOfLines: numberOfLines)
        case .circle(let size):
            let skeletonView = createSkeletonView(size: CGSize(width: size, height: size), cornerRadius: size / 2)
            addSubview(skeletonView)
            skeletonView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                skeletonView.topAnchor.constraint(equalTo: topAnchor),
                skeletonView.leadingAnchor.constraint(equalTo: leadingAnchor),
                skeletonView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                skeletonView.bottomAnchor.constraint(equalTo: bottomAnchor),
                skeletonView.widthAnchor.constraint(equalToConstant: size),
                skeletonView.heightAnchor.constraint(equalToConstant: size)
            ])
        case .row:
            setupRowSkeleton()
        case .rectangle(let size, let isRounded):
            let skeletonView = createSkeletonView(size: size, cornerRadius: isRounded ? Constants.rectangleRadius : 0)
            addSubview(skeletonView)
            skeletonView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                skeletonView.topAnchor.constraint(equalTo: topAnchor),
                skeletonView.leadingAnchor.constraint(equalTo: leadingAnchor),
                skeletonView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                skeletonView.bottomAnchor.constraint(equalTo: bottomAnchor),
                skeletonView.widthAnchor.constraint(equalToConstant: size.width),
                skeletonView.heightAnchor.constraint(equalToConstant: size.height)
            ])
        }
    }

    private func createSkeletonView(size: CGSize, cornerRadius: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = .backgroundSkeleton
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: size.width),
            view.heightAnchor.constraint(equalToConstant: size.height)
        ])

        addPulseAnimation(to: view)
        return view
    }

    private func setupTextSkeleton(numberOfLines: Int) {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = Constants.spacing
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        for i in 0 ..< numberOfLines {
            let isLastLine = i == numberOfLines - 1
            let line = createSkeletonView(size: CGSize(width: bounds.width, height: Constants.lineHeight), cornerRadius: Constants.lineHeight / 2)
            line.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(line)

            if isLastLine {
                line.widthAnchor.constraint(equalTo: stack.widthAnchor, multiplier: 0.8).isActive = true
            } else {
                line.widthAnchor.constraint(equalTo: stack.widthAnchor).isActive = true
            }
        }
    }

    private func setupRowSkeleton() {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = Constants.spacing
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            heightAnchor.constraint(equalToConstant: Constants.rowSkeletonHeight)
        ])

        let circle = createSkeletonView(size: CGSize(width: Constants.circleSize, height: Constants.circleSize), cornerRadius: Constants.circleRadius)
        let rectangle = createSkeletonView(size: CGSize(width: bounds.width - Constants.circleSize - Constants.spacing, height: Constants.lineHeight), cornerRadius: Constants.lineHeight / 2)

        stack.addArrangedSubview(circle)
        stack.addArrangedSubview(rectangle)

        circle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: Constants.circleSize),
            circle.heightAnchor.constraint(equalToConstant: Constants.circleSize),
            rectangle.heightAnchor.constraint(equalToConstant: Constants.lineHeight)
        ])
    }

    private func addPulseAnimation(to view: UIView) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0.5
        animation.duration = 1.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        view.layer.add(animation, forKey: "pulseAnimation")
    }
}
