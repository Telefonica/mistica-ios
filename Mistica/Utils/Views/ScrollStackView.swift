//
//  ScrollStackView.swift
//  Mistica
//
//  Created by pbartolome on 01/10/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

/// This subclass of UIScrollView contains a UIStackView that scrolls vertically
/// and arranges elements vertically. The scroll will be disabled if the size of
/// the elements inside the stack view is smaller than the scrollView.
@dynamicMemberLookup
class ScrollStackView: UIScrollView {
    public lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.preservesSuperviewLayoutMargins = true
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private let arrangedSubviews: [UIView]

    public init(arrangedSubviews: [UIView]) {
        self.arrangedSubviews = arrangedSubviews
        super.init(frame: .zero)

        addSubview(withDefaultConstraints: stackView)
        widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        preservesSuperviewLayoutMargins = true
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    subscript<T>(dynamicMember keyPath: WritableKeyPath<UIStackView, T>) -> T {
        get {
            stackView[keyPath: keyPath]
        }
        set {
            stackView[keyPath: keyPath] = newValue
        }
    }

    func removeArrangedSubviews() {
        stackView.removeArrangedSubviews()
    }

    func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
}
