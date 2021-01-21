//
//  SegmentView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

class SegmentView: UIView {
    private enum Constants {
        static let height: CGFloat = 4
    }

    private lazy var backgroundView = UIView()
    private lazy var trackView = UIView()

    private lazy var widthConstraint = trackView.widthAnchor.constraint(equalToConstant: 0)
    
    var value = 0 {
        didSet {
            updateValueConstraint()
        }
    }

    var minimumValue = 0
    var maximumValue = 100

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: Constants.height)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.makeRounded(cornerRadius: Constants.height / 2)
        updateValueConstraint()
    }
}

// MARK: Internal

extension SegmentView {
    func setValue(_ value: Int, animated: Bool) {
        if animated {
            UIView.animate(withDuration: UIView.defaultAnimationDuration) {
                self.value = value
                self.layoutIfNeeded()
            }
        } else {
            self.value = value
        }
    }
}

// MARK: Private

private extension SegmentView {
    func commonInit() {
        backgroundColor = .clear
        backgroundView.backgroundColor = .control
        trackView.backgroundColor = .controlActivated

        addSubview(backgroundView, constraints: [
            backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
        
        backgroundView.addSubview(trackView, constraints: [
            trackView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            trackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            trackView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor),
            widthConstraint
        ])
    }
    
    func updateValueConstraint() {
        let factor = CGFloat(value) / CGFloat(maximumValue)
        let width = backgroundView.bounds.width * factor
        widthConstraint.constant = width
    }
}
