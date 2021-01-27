//
//  UISwitchTableViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class UISwitchTableViewCell: UITableViewCell {
    private lazy var `switch` = UISwitch()

    public var isOn: Bool {
        get { `switch`.isOn }
        set { `switch`.isOn = newValue }
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
        accessoryView = `switch`
    }
}
