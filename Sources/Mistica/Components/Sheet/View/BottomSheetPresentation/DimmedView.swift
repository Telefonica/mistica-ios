//
//  DimmedView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

class DimmedView: UIView {
    enum DimState {
        case max
        case off
    }

    var dimState: DimState = .off {
        didSet {
            switch dimState {
            case .max:
                alpha = 0.4
            case .off:
                alpha = 0.0
            }
        }
    }

    /// The closure to be executed when a tap occurs
    var didTap: ((_ recognizer: UIGestureRecognizer) -> Void)?

    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))

    // MARK: - Initializers

    init() {
        super.init(frame: .zero)
        alpha = 0.0
        backgroundColor = .backgroundOverlay
        addGestureRecognizer(tapGesture)
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Event Handlers

    @objc private func didTapView() {
        didTap?(tapGesture)
    }
}
