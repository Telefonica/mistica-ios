//
//  ListCollectionViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

open class ListCollectionViewCell: UICollectionViewCell {

    public var listViewCell: ListViewCell = ListViewCell()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonInit() {
        layoutViews()
    }
    
    func layoutViews() {
        contentView.addSubview(listViewCell, constraints: [
            listViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            listViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            listViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            listViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}
