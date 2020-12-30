//
//  Stepper.swift
//  Mistica
//
//  Created by jmpuerta on 28/12/2020.
//

import Foundation
import UIKit

public class StepperView: UIControl {
    enum Constants {
        static let spacing: CGFloat = 8
    }
    
    public var currentStep = 0 {
        didSet {
            layoutView()
            onValueChanged?(currentStep)
        }
    }
    
    public var numberOfSteps = 3 {
        didSet {
            layoutView()
        }
    }
    
    public var isNumbered = false {
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

// MARK: Common

private extension StepperView {
    func commonInit() {
        addSubview(withDefaultConstraints: stackView)
        backgroundColor = .clear
        layoutView()
    }

    var segmentViews: [SegmentView] {
        stackView.arrangedSubviews.compactMap { $0 as? SegmentView }
    }
    
    var stepViews: [StepView] {
        stackView.arrangedSubviews.compactMap { $0 as? StepView }
    }
}

// MARK: Updates

private extension StepperView {
    func createSegment(step: Int) -> SegmentView {
        let segmentView = SegmentView()
        update(segmentView: segmentView, at: step)
        return segmentView
    }
    
    func createStep(step: Int) -> StepView {
        let stepView = StepView()
        // Aspect ratio 1 constraint, it keeps squared even if the text grows.
        stepView.widthAnchor.constraint(equalTo: stepView.heightAnchor).isActive.toggle()
        update(stepView: stepView, at: step)
        return stepView
    }
    
    func update(segmentView: SegmentView, at step: Int) {
        segmentView.minimumValue = 0
        segmentView.maximumValue = numberOfSteps
        if !isNumbered {
            segmentView.value = currentStep
        } else if step <= currentStep {
            segmentView.value = segmentView.maximumValue
        } else {
            segmentView.value = segmentView.minimumValue
        }
    }
    
    func update(stepView: StepView, at step: Int) {
        stepView.step = step
        if step == currentStep {
            stepView.status = .activated
        } else if step < currentStep {
            stepView.status = .completed
        } else {
            stepView.status = .waiting
        }
    }
}

// MARK: Layout

private extension StepperView {
    func layoutView() {
        if isNumbered {
            layoutNumberedView()
        } else {
            layoutNonNumberedView()
        }
    }
    
    func layoutNumberedView() {
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
    
    func layoutNonNumberedView() {
        stackView.removeArrangedSubviews()
        stackView.addArrangedSubview(createSegment(step: currentStep))
    }
}
