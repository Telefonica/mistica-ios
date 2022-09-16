//
//  UIStepperTableViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public class UIStepperTableViewCell: UITableViewCell {
    private let numberOfStepsStepper = UIStepper()
    private let titleLabel = UILabel()
    private let numberOfStepsLabel = UILabel()
    private lazy var textStackView = UIStackView(arrangedSubviews: [titleLabel, numberOfStepsLabel])
    private lazy var numberOfStepsStackView = UIStackView(arrangedSubviews: [textStackView, numberOfStepsStepper])
    var didValueChange: ((UIStepper) -> Void)?

    var minValue: Double {
        get { numberOfStepsStepper.minimumValue }
        set { numberOfStepsStepper.minimumValue = newValue }
    }

    var currentValue: Double {
        get { numberOfStepsStepper.value }
        set { numberOfStepsStepper.value = newValue }
    }

    var maxValue: Double {
        get { numberOfStepsStepper.maximumValue }
        set { numberOfStepsStepper.maximumValue = newValue }
    }

    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    var numberOfSteps: String? {
        get { numberOfStepsLabel.text }
        set { numberOfStepsLabel.text = newValue }
    }

    public init(reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        selectionStyle = .none
        textStackView.distribution = .fill
        textStackView.alignment = .leading
        numberOfStepsStackView.distribution = .equalSpacing
        numberOfStepsStackView.alignment = .center

        contentView.addSubview(constrainedToLayoutMarginsGuideOf: numberOfStepsStackView)
        numberOfStepsStepper.addTarget(self, action: #selector(didValueChange(_:)), for: .valueChanged)
    }
}

private extension UIStepperTableViewCell {
    @objc func didValueChange(_ sender: UIStepper) {
        didValueChange?(sender)
    }
}
