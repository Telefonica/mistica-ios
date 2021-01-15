//
//  CardRichMedia.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

class CardRichMedia: UIView {
    init(itemView: UIView, topSpacing: CGFloat, bottomSpacing: CGFloat) {
        super.init(frame: .zero)

        addSubview(itemView, constraints: [
            itemView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            itemView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            itemView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
        insetsLayoutMarginsFromSafeArea = false
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: topSpacing, leading: 0, bottom: bottomSpacing, trailing: 0)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
