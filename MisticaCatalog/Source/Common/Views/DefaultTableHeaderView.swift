//
//  DefaultTableHeaderView.swift
//  MisticaCatalog
//
//  Created by Jose Miguel Brocal on 03/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
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

        label.font = .textPreset7(.regular)
        label.textColor = .textSecondary
        label.backgroundColor = .clear
    }
}
