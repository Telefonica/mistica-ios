//
//  SectionTitleHeaderView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

private enum ViewStyles {
    static let horizontalMarging: CGFloat = 16
    static let topMarging: CGFloat = 16
    static let bottomMarging: CGFloat = 8
    static let minimumHeight: CGFloat = 40
}

public class SectionTitleHeaderView: UITableViewHeaderFooterView {
    private lazy var titleLabel = UILabel()

    public var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue?.uppercased()
            layoutIfNeeded()
        }
    }

    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setUpView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setUpView()
    }
}

private extension SectionTitleHeaderView {
    func setUpView() {
        layoutViews()

        contentView.backgroundColor = .background

        titleLabel.font = .textPreset1(weight: .medium)
        titleLabel.textColor = .textSecondary
        titleLabel.numberOfLines = 0
    }

    func layoutViews() {
        preservesSuperviewLayoutMargins = false
        contentView.preservesSuperviewLayoutMargins = false

        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: ViewStyles.topMarging,
            leading: ViewStyles.horizontalMarging,
            bottom: ViewStyles.bottomMarging,
            trailing: ViewStyles.horizontalMarging
        )

        contentView.addSubview(constrainedToLayoutMarginsGuideOf: titleLabel)
    }
}
