//
//  SectionTitleHeaderView.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 11/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
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

    override public func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(targetSize,
                                                 withHorizontalFittingPriority: horizontalFittingPriority,
                                                 verticalFittingPriority: verticalFittingPriority)
        let sectionTitleViewSize = titleLabel.systemLayoutSizeFitting(targetSize,
                                                                      withHorizontalFittingPriority: horizontalFittingPriority,
                                                                      verticalFittingPriority: verticalFittingPriority)

        return CGSize(width: size.width, height: max(sectionTitleViewSize.height, ViewStyles.minimumHeight))
    }
}

private extension SectionTitleHeaderView {
    func setUpView() {
        layoutViews()

        contentView.backgroundColor = .background

        titleLabel.font = .textPreset8(.medium)
        titleLabel.textColor = .textSecondary
        titleLabel.numberOfLines = 0
    }

    func layoutViews() {
        preservesSuperviewLayoutMargins = false
        contentView.preservesSuperviewLayoutMargins = false

        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: ViewStyles.topMarging,
                                                                       leading: ViewStyles.horizontalMarging,
                                                                       bottom: ViewStyles.bottomMarging,
                                                                       trailing: ViewStyles.horizontalMarging)

        contentView.addSubview(constrainedToLayoutMarginsGuideOf: titleLabel)
    }
}
