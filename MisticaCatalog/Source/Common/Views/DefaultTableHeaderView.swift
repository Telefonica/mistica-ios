//
//  DefaultTableHeaderView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

class DefaultTableHeaderView: UIView {
    private let label = UILabel()

    var title: String? {
        get {
            label.text
        }
        set {
            label.text = newValue
        }
    }

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame _: CGRect) {
        super.init(frame: .zero)

        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DefaultTableHeaderView {
    func commonInit() {
        addSubview(label, constraints: [
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        label.font = .textPreset2(weight: .regular)
        label.textColor = .textSecondary
        label.backgroundColor = .clear
    }
}
