//
//  UISegmentedControlTableViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
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
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
}
