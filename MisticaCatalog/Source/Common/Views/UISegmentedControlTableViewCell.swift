//
//  UISegmentedControlTableViewCell.swift
//  CommonUIKit
//
//  Created by Pablo Carcelén on 26/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public class UISegmentedControlTableViewCell: UITableViewCell {
    public lazy var segmentedControl = UISegmentedControl()

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
        addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            layoutMarginsGuide.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor),
            layoutMarginsGuide.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
            layoutMarginsGuide.topAnchor.constraint(equalTo: segmentedControl.topAnchor),
            layoutMarginsGuide.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor)
        ])
    }
}
