//
//  ListCollectionViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

open class ListCollectionViewCell: UICollectionViewCell {
    public var listCellContentView = ListCellContentView()

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
        contentView.addSubview(listCellContentView, constraints: [
            contentView.topAnchor.constraint(equalTo: listCellContentView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: listCellContentView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: listCellContentView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: listCellContentView.leadingAnchor),
            contentView.widthAnchor.constraint(equalToConstant: ListCellContentView.ViewStyles.cellWidth)
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

        return CGSize(width: size.width, height: max(size.height, listCellContentView.cellStyle.minHeight))
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        listCellContentView.cellBorderView.layer.borderColor = listCellContentView.cellStyle.borderColor
    }
}
