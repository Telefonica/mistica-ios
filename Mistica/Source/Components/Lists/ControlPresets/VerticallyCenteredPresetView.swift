//
//  VerticallyCenteredPresetView.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 25/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

/// VerticallyCenteredPresetView aligns the center of its arranged view with its center of the cell view.
public class VerticallyCenteredPresetView: UIView {
    private let stackView = UIStackView()

    public var arrangedSubview: UIView? {
        didSet {
            oldValue?.removeFromSuperview()

            if let view = arrangedSubview {
                stackView.addArrangedSubview(view)
            }
        }
    }

    public convenience init(arrangedSubview: UIView) {
        self.init(frame: .zero)

        stackView.addArrangedSubview(arrangedSubview)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }
}

private extension VerticallyCenteredPresetView {
    func commonInit() {
        addSubview(withDefaultConstraints: stackView)

        stackView.axis = .horizontal
        stackView.alignment = .center
    }
}
