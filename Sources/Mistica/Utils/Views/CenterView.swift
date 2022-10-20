//
//  CenterView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

class CenterView: UIView {
    enum Axis {
        case vertical
        case horizontal
    }

    private let axis: Axis

    private let stackView = UIStackView()

    var arrangedSubview: UIView? {
        didSet {
            oldValue?.removeFromSuperview()

            if let view = arrangedSubview {
                stackView.addArrangedSubview(view)
            }
        }
    }

    init(arrangedSubview: UIView, axis: Axis) {
        self.axis = axis

        super.init(frame: .zero)

        stackView.addArrangedSubview(arrangedSubview)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CenterView {
    func commonInit() {
        addSubview(withDefaultConstraints: stackView)

        switch axis {
        case .vertical:
            stackView.axis = .horizontal
        case .horizontal:
            stackView.axis = .vertical
        }
        stackView.alignment = .center
    }
}
