//
//  ButtonContentView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

/// Internal class used by Button
class ButtonContentView: UIView {
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        return titleLabel
    }()

    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(style: .gray)
        loadingIndicator.startAnimating()
        return loadingIndicator
    }()

    private lazy var loadingTitleLabel: UILabel = {
        let loadingTitleLabel = UILabel()
        loadingTitleLabel.isHidden = true
        return loadingTitleLabel
    }()

    var title: String? {
        get { titleLabel.text }
        set {
            titleLabel.text = newValue
            invalidateIntrinsicContentSize()
        }
    }

    var loadingTitle: String? {
        get { loadingTitleLabel.text }
        set {
            loadingTitleLabel.isHidden = newValue == nil
            loadingTitleLabel.text = newValue
            invalidateIntrinsicContentSize()
        }
    }

    var font: UIFont {
        get { titleLabel.font }
        set {
            titleLabel.font = newValue
            loadingTitleLabel.font = newValue
        }
    }

    var textColor: UIColor {
        get { titleLabel.textColor }
        set {
            loadingIndicator.color = newValue
            titleLabel.textColor = newValue
            loadingTitleLabel.textColor = newValue
        }
    }

    var minimumWidth: CGFloat = 0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    private lazy var loadingStackView: UIStackView = {
        let horizontalStackView = UIStackView(arrangedSubviews: [loadingIndicator, loadingTitleLabel])
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 8
        horizontalStackView.distribution = .fill

        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.addArrangedSubview(horizontalStackView)

        // initial state
        verticalStackView.alpha = 0
        return verticalStackView
    }()

    init() {
        super.init(frame: .zero)
        clipsToBounds = true
        accessibilityElementsHidden = true
        setContentHuggingPriority(.required, for: .vertical)

        setContentCompressionResistancePriority(.required, for: .vertical)

        addSubview(constrainedToLayoutMarginsGuideOf: titleLabel)
        addSubview(constrainedToLayoutMarginsGuideOf: loadingStackView)
    }

    override var intrinsicContentSize: CGSize {
        let titleLabelSize = titleLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let loadingStackViewSize = loadingStackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let width = max(titleLabelSize.width, loadingStackViewSize.width)
        let height = max(titleLabelSize.height, loadingStackViewSize.height)
        var size = CGSize(width: width, height: height).inset(by: layoutMargins)
        size.width = max(size.width, minimumWidth)
        return size
    }

    func willTransitionToLoading() {
        loadingStackView.transform = CGAffineTransform(translationX: 0, y: bounds.maxY)
    }

    func transitionToLoading() {
        titleLabel.alpha = 0
        titleLabel.transform = CGAffineTransform(translationX: 0, y: -bounds.maxY)
        loadingStackView.alpha = 1
        loadingStackView.transform = CGAffineTransform(translationX: 0, y: 0)
        loadingStackView.layoutIfNeeded()
    }

    func transitionToNormal() {
        titleLabel.alpha = 1
        titleLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        loadingStackView.alpha = 0
        loadingStackView.transform = CGAffineTransform(translationX: 0, y: bounds.maxY)
        loadingStackView.layoutIfNeeded()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
