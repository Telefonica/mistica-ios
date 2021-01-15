//
//  CardContentItem.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

@dynamicMemberLookup
class CardContentItem<Element: UIView>: UIStackView {
    private var item: Element

    init(topSpacing: CGFloat) {
        item = Element(frame: .zero)

        super.init(frame: .zero)

        addArrangedSubview(item)

        axis = .vertical
        alignment = .leading
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: topSpacing, leading: 0, bottom: 0, trailing: 0)
        isLayoutMarginsRelativeArrangement = true
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public subscript<T>(dynamicMember keyPath: WritableKeyPath<Element, T>) -> T {
        get {
            item[keyPath: keyPath]
        }
        set {
            item[keyPath: keyPath] = newValue
        }
    }
}
