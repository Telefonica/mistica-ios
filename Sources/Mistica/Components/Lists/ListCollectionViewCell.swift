//
//  ListCollectionViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

open class ListCollectionViewCell: UICollectionViewCell {
    public var listViewCell = ListViewCell()

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonInit() {
        layoutViews()
    }

    func layoutViews() {
        contentView.addSubview(listViewCell, constraints: [
            contentView.topAnchor.constraint(equalTo: listViewCell.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: listViewCell.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: listViewCell.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: listViewCell.leadingAnchor),
            contentView.widthAnchor.constraint(equalToConstant: ListViewCell.ViewStyles.cellWidth)
        ])
    }

    override public func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: horizontalFittingPriority,
            verticalFittingPriority: verticalFittingPriority
        )

        return CGSize(width: size.width, height: max(size.height, listViewCell.cellStyle.minHeight))
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        listViewCell.cellBorderView.layer.borderColor = listViewCell.cellStyle.borderColor
    }
}
