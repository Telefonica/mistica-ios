//
//  File.swift
//  
//
//  Created by jmpuerta on 30/12/2020.
//

import Foundation
import UIKit

class SegmentView: UIView {
    private enum Constants {
        static let height: CGFloat = 4
    }
    
    private lazy var slider = UISlider(frame: bounds)
    
    private var _value: Int = 0
    var value: Int {
        set { setValue(newValue, animated: false) }
        get { Int(slider.value) }
    }
    
    var minimumValue: Int = 0 {
        didSet {
            slider.minimumValue = Float(minimumValue)
        }
    }
    
    var maximumValue: Int = 1 {
        didSet {
            slider.maximumValue = Float(maximumValue)
        }
    }
    
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
        layer.cornerRadius = bounds.size.height / 2
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        layer.masksToBounds = true
    }
}

// MARK: Public

extension SegmentView {
    func setValue(_ value: Int, animated: Bool) {
        slider.setValue(Float(value), animated: animated)
    }
}

// MARK: Private

private extension SegmentView {
    func commonInit() {
        slider.backgroundColor = .control
        slider.tintColor = .controlActivated
        slider.backgroundColor = .clear
        slider.setThumbImage(UIImage(), for: .normal)
        
        addSubview(withDefaultConstraints: slider)
    }
}
