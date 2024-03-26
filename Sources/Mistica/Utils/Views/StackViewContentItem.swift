//
//  StackViewContentItem.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// The texts inside of the Callouts, EmptyStates and Cards are distributed with a vertical spacing after each text.
///
/// Implementing the layout using a UIStackView is complex because the UIStackView only allows
/// setting the space after a view, whereas we need to set the space before a view.
///
/// This custom view is responsible for adding a vertical space to a subview, which allows us to simplify
/// the spaces between the texts of a letter. When a text is not configured, her vertical spacing is also ignored.
@dynamicMemberLookup
class StackViewContentItem<Element: UIView>: UIStackView {
    var item: Element

    var topSpacing: CGFloat {
        didSet {
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: topSpacing, leading: 0, bottom: 0, trailing: 0)
        }
    }

    init(topSpacing: CGFloat) {
        item = Element(frame: .zero)
        self.topSpacing = topSpacing

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

    override var accessibilityIdentifier: String? {
        get {
            item.accessibilityIdentifier
        }
        set {
            item.accessibilityIdentifier = newValue
        }
    }
}
