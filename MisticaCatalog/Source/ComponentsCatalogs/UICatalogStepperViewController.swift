//
//  UICatalogStepperViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case indeterminate
    case determinate
    case configuration
}

class UICatalogStepperViewController: UITableViewController {
    private var numberOfSteps = 3
    private var minimumNumberOfSteps = 2
    private var maximumNumberOfSteps = 5
    private var currentStep = 0

    private var indeterminateStepperView: IndeterminateStepperView!
    private var determinateStepperView: DeterminateStepperView!

    private let currentStepStepper = UIStepper()
    private let currentStepLabel = UILabel()
    private lazy var currentStepStackView = UIStackView(arrangedSubviews: [currentStepLabel, currentStepStepper])

    private let numberOfStepsStepper = UIStepper()
    private let numberOfStepsLabel = UILabel()
    private lazy var numberOfStepsStackView = UIStackView(arrangedSubviews: [numberOfStepsLabel, numberOfStepsStepper])

    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stepper"

        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive
    }
}

extension UICatalogStepperViewController {
    override func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)!.headerTitle
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let containerView: UIView
        let section = Section(rawValue: indexPath.section)!

        switch section {
        case .indeterminate:
            indeterminateStepperView = IndeterminateStepperView()
            containerView = indeterminateStepperView
        case .determinate:
            determinateStepperView = DeterminateStepperView()
            determinateStepperView.numberOfSteps = numberOfSteps
            containerView = determinateStepperView
        case .configuration:
            // Current Step
            currentStepStepper.maximumValue = Double(numberOfSteps)
            currentStepStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
            currentStepLabel.text = "Current step: \(currentStep)"
            updateCurrentStepLabel()

            currentStepStackView.distribution = .equalSpacing
            currentStepStackView.alignment = .center

            // Number Of Steps
            numberOfStepsStepper.minimumValue = Double(minimumNumberOfSteps)
            numberOfStepsStepper.maximumValue = Double(maximumNumberOfSteps)
            numberOfStepsStepper.value = Double(numberOfSteps)
            numberOfStepsStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
            updateNumberOfStepsLabel()

            numberOfStepsStackView.distribution = .equalSpacing
            numberOfStepsStackView.alignment = .center

            // Vertical stack view
            let stackView = UIStackView(arrangedSubviews: [numberOfStepsStackView, currentStepStackView])
            stackView.axis = .vertical
            stackView.spacing = 8

            containerView = stackView
        }

        return CellView(view: containerView, reuseIdentifier: "Cell")
    }

    func updateNumberOfStepsLabel() {
        numberOfStepsLabel.text = "Number of steps: \(numberOfSteps)"
    }

    func updateCurrentStepLabel() {
        currentStepLabel.text = "Current step: \(currentStep)"
    }

    @objc func stepperValueChanged(sender: UIStepper) {
        if sender == numberOfStepsStepper {
            numberOfSteps = Int(sender.value)
            determinateStepperView.numberOfSteps = numberOfSteps
            currentStepStepper.maximumValue = sender.value
            updateNumberOfStepsLabel()
        }

        if sender == currentStepStepper {
            currentStep = Int(sender.value)
            updateCurrentStepLabel()
        }

        updateStepperValues()
    }

    func updateStepperValues() {
        indeterminateStepperView.setValue(Int(Float(currentStep) / Float(numberOfSteps) * 100), animated: true)
        determinateStepperView.setCurrentStep(currentStep, animated: true)
    }
}

private class CellView: UITableViewCell {
    public init(view: UIView, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: view)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension Section {
    var headerTitle: String {
        switch self {
        case .determinate:
            return "Determinate"
        case .indeterminate:
            return "Indeterminate"
        case .configuration:
            return "Configuration"
        }
    }
}
