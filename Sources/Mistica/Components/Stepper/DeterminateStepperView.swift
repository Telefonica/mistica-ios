//
//  DeterminateStepperView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

open class DeterminateStepperView: UIControl {
    enum Constants {
        static let spacing: CGFloat = 8
    }

    private var _currentStep = 0
    /// Use this property to get and set the stepper's current step. To render an animated transition from the current value to the new value, use the setCurrentStep(_:animated:) method instead.
    /// If you try to set a value that is below 0 or the number of steps, a sanitized value is set. The default value of this property is 0.
    public var currentStep: Int {
        set {
            setCurrentStep(newValue, animated: false)
        }
        get {
            _currentStep
        }
    }

    /// Use this property to get and set the stepper's number of steps. The default value of this property is 3.
    public var numberOfSteps = 3 {
        didSet {
            layoutView()
        }
    }

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Constants.spacing
        stackView.alignment = .center
        return stackView
    }()

    // Called when the Stepper changes its value.
    public var onStepChanged: ((Int) -> Void)?

    public convenience init() {
        self.init(frame: .zero)
        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override public var allControlEvents: UIControl.Event {
        [.valueChanged]
    }

    override public var intrinsicContentSize: CGSize {
        stackView.intrinsicContentSize
    }
}

// MARK: Public

public extension DeterminateStepperView {
    func setCurrentStep(_ currentStep: Int, animated: Bool) {
        let sanitizedStep = min(max(currentStep, 0), numberOfSteps)
        _currentStep = sanitizedStep

        for (step, segmentView) in segmentViews.enumerated() {
            update(segmentView: segmentView, at: step + 1, animated: animated)
        }

        for (step, stepView) in stepViews.enumerated() {
            update(stepView: stepView, at: step, animated: animated)
        }

        onStepChanged?(sanitizedStep)
        sendActions(for: .valueChanged)
    }
}

// MARK: Common

private extension DeterminateStepperView {
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
        accessibilityLabel = formatter.string(from: NSNumber(integerLiteral: currentStep + 1))
    }
}

// MARK: Updates

private extension DeterminateStepperView {
    func createSegment(step: Int) -> SegmentView {
        let segmentView = SegmentView()
        segmentView.minimumValue = 0
        segmentView.maximumValue = numberOfSteps
        update(segmentView: segmentView, at: step, animated: false)
        return segmentView
    }

    func createStep(step: Int) -> StepView {
        let stepView = StepView()
        // Aspect ratio 1 constraint, it keeps squared even if the text grows.
        stepView.widthAnchor.constraint(equalTo: stepView.heightAnchor).isActive = true
        update(stepView: stepView, at: step, animated: false)
        return stepView
    }

    func update(segmentView: SegmentView, at step: Int, animated: Bool) {
        if step <= currentStep {
            segmentView.setValue(segmentView.maximumValue, animated: animated)
        } else {
            segmentView.setValue(segmentView.minimumValue, animated: animated)
        }
    }

    func update(stepView: StepView, at step: Int, animated: Bool) {
        if step == currentStep {
            stepView.setState(.active(step: step), animated: animated)
        } else if step < currentStep {
            stepView.setState(.done, animated: animated)
        } else {
            stepView.setState(.pending(step: step), animated: animated)
        }
    }
}

// MARK: Layout

private extension DeterminateStepperView {
    func layoutView() {
        stackView.removeArrangedSubviews()

        var arrangedSubviews: [UIView] = [createStep(step: 0)]
        for step in 1 ..< numberOfSteps {
            arrangedSubviews.append(createSegment(step: step))
            arrangedSubviews.append(createStep(step: step))
        }

        try? arrangedSubviews.forEach(stackView.addArrangedSubview)

        activateSegmentsWidthConstraints()

        // Make the update on the stackview non animated.
        // It will avoid weird animations (only) while adding or removing steps.
        UIView.performWithoutAnimation {
            stackView.setNeedsLayout()
            stackView.layoutIfNeeded()
        }
    }

    func activateSegmentsWidthConstraints() {
        guard let firstSegment = segmentViews.first else { return }

        for segment in segmentViews where firstSegment != segment {
            segment.widthAnchor.constraint(equalTo: firstSegment.widthAnchor).isActive = true
        }
    }
}
