//
//  StepperView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

public class StepperView: UIControl {
    enum Constants {
        static let spacing: CGFloat = 8
    }
    
    private var _currentStep = 0
    public var currentStep: Int {
        set {
            setCurrentStep(newValue, animated: false)
            updateAccesibilityValues()
        }
        get {
            _currentStep
        }
    }
    
    public var numberOfSteps = 3 {
        didSet {
            updateAccesibilityValues()
            layoutView()
        }
    }
    
    public var isDetermined = false {
        didSet {
            layoutView()
        }
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Constants.spacing
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()

    // Called when the Checkbox changes its value.
    public var onValueChanged: ((Int) -> Void)?

    public convenience init() {
        self.init(frame: .zero)
        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override public var allControlEvents: UIControl.Event {
        [.valueChanged]
    }
    
    public override var intrinsicContentSize: CGSize {
        stackView.intrinsicContentSize
    }
}

// MARK: Public

public extension StepperView {
    func setCurrentStep(_ currentStep: Int, animated: Bool) {
        _currentStep = currentStep
        
        for (step, segmentView) in segmentViews.enumerated() {
            // Segments are in even indices. The correct step
            update(segmentView: segmentView, at: step+1, animated: animated)
        }
        
        for (step, stepView) in stepViews.enumerated() {
            update(stepView: stepView, at: step, animated: animated)
        }
        
        onValueChanged?(currentStep)
    }
}

// MARK: Common

private extension StepperView {
    func commonInit() {
        addSubview(withDefaultConstraints: stackView)
        isAccessibilityElement = true
        updateAccesibilityValues()
        backgroundColor = .clear
        layoutView()
    }

    var segmentViews: [SegmentView] {
        stackView.arrangedSubviews.compactMap { $0 as? SegmentView }
    }
    
    var stepViews: [StepView] {
        stackView.arrangedSubviews.compactMap { $0 as? StepView }
    }
    
    func updateAccesibilityValues() {
        let formatter = NumberFormatter()
        accessibilityLabel = formatter.string(from: NSNumber(integerLiteral: currentStep+1))
        accessibilityTraits = [.adjustable]
    }
}

// MARK: Updates

private extension StepperView {
    func createSegment(step: Int) -> SegmentView {
        let segmentView = SegmentView()
        update(segmentView: segmentView, at: step, animated: false)
        return segmentView
    }
    
    func createStep(step: Int) -> StepView {
        let stepView = StepView()
        // Aspect ratio 1 constraint, it keeps squared even if the text grows.
        stepView.widthAnchor.constraint(equalTo: stepView.heightAnchor).isActive.toggle()
        update(stepView: stepView, at: step, animated: false)
        return stepView
    }
    
    func update(segmentView: SegmentView, at step: Int, animated: Bool) {
        segmentView.minimumValue = 0
        segmentView.maximumValue = numberOfSteps
        if !isDetermined {
            segmentView.setValue(currentStep, animated: animated)
        } else if step <= currentStep {
            segmentView.setValue(segmentView.maximumValue, animated: animated)
        } else {
            segmentView.setValue(segmentView.minimumValue, animated: animated)
        }
    }
    
    func update(stepView: StepView, at step: Int, animated: Bool) {
        if step == currentStep {
            stepView.setStatus(.activated(step: step), animated: animated)
        } else if step < currentStep {
            stepView.setStatus(.completed, animated: animated)
        } else {
            stepView.setStatus(.waiting(step: step), animated: animated)
        }
    }
}

// MARK: Layout

private extension StepperView {
    func layoutView() {
        if isDetermined {
            layoutDeterminedView()
        } else {
            layoutIndeterminateView()
        }
    }
    
    func layoutDeterminedView() {
        stackView.removeArrangedSubviews()
        
        var arrangedSubviews: [UIView] = [createStep(step: 0)]
        for step in 1..<numberOfSteps {
            arrangedSubviews.append(createSegment(step: step))
            arrangedSubviews.append(createStep(step: step))
        }

        arrangedSubviews.forEach(stackView.addArrangedSubview)
        
        activateSegmentsWidthConstraints()
    }
    
    func activateSegmentsWidthConstraints() {
        guard let firstSegment = segmentViews.first else { return }
        
        for segment in segmentViews where firstSegment != segment {
            segment.widthAnchor.constraint(equalTo: firstSegment.widthAnchor).isActive.toggle()
        }
    }
    
    func layoutIndeterminateView() {
        stackView.removeArrangedSubviews()
        stackView.addArrangedSubview(createSegment(step: currentStep))
    }
}
