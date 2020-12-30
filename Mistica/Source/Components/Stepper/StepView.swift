//
//  File.swift
//  
//
//  Created by jmpuerta on 30/12/2020.
//

import Foundation
import UIKit

class StepView: UIView {
    private enum Constants {
        static let height: CGFloat = 24
    }
    
    enum Status {
        case completed
        case activated
        case waiting
    }
    
    var step: Int = 0
    var status: Status = .waiting {
        didSet {
            updateSatusStyle(status)
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
        
        #warning("Get correct image")
        imageView.image = UIImage(named: "icn_checkbox_on", type: .brandedAndThemed)
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

private extension StepView {
    func updateSatusStyle(_ status: Status) {
        let step = "\(self.step + 1)"
        switch status {
        case .completed:
            imageView.isHidden = false
            label.isHidden = true
            removeBorder()
            backgroundColor = .controlActivated
        case .activated:
            label.text = step
            label.textColor = .textPrimaryInverse
            label.isHidden = false
            imageView.isHidden = true
            removeBorder()
            backgroundColor = .controlActivated
        case .waiting:
            label.text = step
            label.textColor = .borderDark
            label.isHidden = false
            imageView.isHidden = true
            addBorder(borderColor: .borderDark)
            backgroundColor = .clear
        }
    }
}
