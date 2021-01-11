//
//  StepView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

class StepView: UIView {
    private enum Constants {
        static let height: CGFloat = 24
    }
    
    enum Status {
        case completed
        case activated(step: Int)
        case waiting(step: Int)
    }
        
    private var _status: Status = .completed
    var status: Status  {
        get {
            _status
        }
        set {
            setStatus(newValue, animated: false)
        }
    }
    
    private lazy var label = UILabel(frame: bounds)
    private lazy var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        label.font = .textPreset8(weight: .medium)
        label.textAlignment = .center
        addSubview(withDefaultConstraints: label)
        
        imageView.image = UIImage(named: "icn_check_stepper", type: .brandedAndThemed)
        addSubview(withDefaultConstraints: imageView)
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: Constants.height, height: Constants.height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height / 2
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        layer.masksToBounds = true
    }
}

// MARK: Public

extension StepView {
    func setStatus(_ status: Status, animated: Bool) {
        _status = status
        let animations = {
            switch status {
            case .completed:
                self.imageView.isHidden = false
                self.label.isHidden = true
                self.removeBorder()
                self.backgroundColor = .clear
                self.accessibilityTraits = []
            case .activated(let step):
                self.label.text = "\(step + 1)"
                self.label.textColor = .textPrimaryInverse
                self.label.isHidden = false
                self.imageView.isHidden = true
                self.removeBorder()
                self.backgroundColor = .controlActivated
                self.accessibilityTraits = [.selected]
            case .waiting(let step):
                self.label.text = "\(step + 1)"
                self.label.textColor = .borderDark
                self.label.isHidden = false
                self.imageView.isHidden = true
                self.addBorder(borderColor: .borderDark)
                self.backgroundColor = .clear
                self.accessibilityTraits = []
            }
        }
        
        if animated {
            UIView.transition(with: self, duration: UIView.defaultAnimationDuration, options: .transitionCrossDissolve, animations: animations, completion: nil)
        } else {
            animations()
        }
    }
}
