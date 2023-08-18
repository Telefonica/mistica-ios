//
//  ButtonContentView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// Internal class used by Button
class ButtonContentView: UIView {
    private lazy var titleContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleStackView])
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()

    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            rightImageView
        ])
        stackView.alignment = .center
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        return titleLabel
    }()

    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()

    private lazy var rightImageHeightConstraint: NSLayoutConstraint = rightImageView.heightAnchor.constraint(equalToConstant: 1)

    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(style: .medium)
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
            rightImageView.tintColor = newValue
            loadingTitleLabel.textColor = newValue
        }
    }

    var rightImage: Button.RightImage? {
        didSet {
            rightImageView.isHidden = rightImage == nil
            guard let rightImage else { return }
            titleStackView.setCustomSpacing(rightImage.space, after: titleLabel)
            rightImageView.image = rightImage.image
        }
    }

    var rightImageHeight: CGFloat {
        get { rightImageHeightConstraint.constant }
        set { rightImageHeightConstraint.constant = newValue }
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

        addSubview(constrainedToLayoutMarginsGuideOf: titleContentStackView)
        addSubview(constrainedToLayoutMarginsGuideOf: loadingStackView)

        rightImageHeightConstraint.isActive = true
    }

    override var intrinsicContentSize: CGSize {
        let titleSize = titleContentStackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let loadingStackViewSize = loadingStackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let width = max(titleSize.width, loadingStackViewSize.width)
        let height = max(titleSize.height, loadingStackViewSize.height)
        var size = CGSize(width: width, height: height).inset(by: layoutMargins)
        size.width = max(size.width, minimumWidth)
        return size
    }

    func willTransitionToLoading() {
        loadingStackView.transform = CGAffineTransform(translationX: 0, y: bounds.maxY)
    }

    func transitionToLoading() {
        titleContentStackView.alpha = 0
        titleContentStackView.transform = CGAffineTransform(translationX: 0, y: -bounds.maxY)
        loadingStackView.alpha = 1
        loadingStackView.transform = CGAffineTransform(translationX: 0, y: 0)
        loadingStackView.layoutIfNeeded()
    }

    func transitionToNormal() {
        titleContentStackView.alpha = 1
        titleContentStackView.transform = CGAffineTransform(translationX: 0, y: 0)
        loadingStackView.alpha = 0
        loadingStackView.transform = CGAffineTransform(translationX: 0, y: bounds.maxY)
        loadingStackView.layoutIfNeeded()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
