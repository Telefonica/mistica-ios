//
//  SheetViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public protocol SheetViewControllerDelegate: AnyObject {
    func sheetViewControllerDidStartDragging(_ sheetViewController: SheetViewController)
    func sheetViewController(
        _ sheetViewController: SheetViewController,
        didDrag percentage: CGFloat
    )
    func sheetViewControllerDidEndDragging(_ selectorViewController: SheetViewController)
}

public class SheetViewController: UIViewController {
    private lazy var titleLabel: IntrinsictHeightLabel? = {
        if let title = config.header.title {
            let label = IntrinsictHeightLabel()
            label.minHeight = 24
            label.text = title
            label.numberOfLines = 0
            label.textAlignment = .left
            label.textColor = .textPrimary
            label.font = .textPreset4(weight: .regular)
            return label
        }
        return nil
    }()

    var titleAccessibilityIdentifier: String? {
        get {
            titleLabel?.accessibilityIdentifier
        }
        set {
            titleLabel?.accessibilityIdentifier = newValue
        }
    }

    private lazy var subtitleLabel: UILabel? = {
        if let subtitle = config.header.subtitle {
            let label = UILabel()
            label.text = subtitle
            label.numberOfLines = 0
            label.textColor = .textPrimary
            label.font = .textPreset2(weight: .regular)
            return label
        }
        return nil
    }()

    var subtitleAccessibilityIdentifier: String? {
        get {
            subtitleLabel?.accessibilityIdentifier
        }
        set {
            subtitleLabel?.accessibilityIdentifier = newValue
        }
    }

    private lazy var descriptionLabel: UILabel? = {
        if let description = config.header.description {
            let label = UILabel()
            label.text = description
            label.numberOfLines = 0
            label.textColor = .textSecondary
            label.font = .textPreset2(weight: .regular)
            return label
        }
        return nil
    }()

    var descriptionAccessibilityIdentifier: String? {
        get {
            descriptionLabel?.accessibilityIdentifier
        }
        set {
            descriptionLabel?.accessibilityIdentifier = newValue
        }
    }

    /// The view displaying a handle on the presented view.
    private let handleView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 2.0
        view.backgroundColor = .control
        return view
    }()

    public var completionHandler: ((SheetSelectionResponse) -> Void)?
    public var sheetSelectionResponse: SheetSelectionResponse
    public weak var delegate: SheetViewControllerDelegate?

    private let config: SheetConfiguration
    private var contentInfo: [String: [String: RadioButton]] = [:]
    private var contentSelected: [SheetResponseResult] = []
    private var panGestureBeginningY: CGFloat = 0
    private var isDismissing: Bool = false
    
    private class ItemInformationTapGesture: UITapGestureRecognizer {
        var contentId: String = ""
        var itemId: String = ""
        var autoSubmit: Bool = false
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(gesture:)))
        view.addGestureRecognizer(gesture)
    }

    public init(configuration: SheetConfiguration, completionHandler: ((SheetSelectionResponse) -> Void)?) {
        config = configuration
        self.completionHandler = completionHandler
        // Initial value for a dismissed response
        sheetSelectionResponse = .init(
            action: .dismiss,
            selectedIds: config.content.map {
                SheetResponseResult(id: $0.id, selected: ($0.selectedId != nil) ? [$0.selectedId!] : [])
            }
        )

        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        completionHandler?(sheetSelectionResponse)
    }
}

public extension SheetViewController {
    func setupView() {
        view.backgroundColor = .backgroundContainer
        view.makeRounded(cornerRadius: 8.0)

        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)

        let topStackView = UIStackView()
        topStackView.axis = .vertical
        topStackView.distribution = .fill
        topStackView.spacing = 12.0
        topStackView.translatesAutoresizingMaskIntoConstraints = false

        handleView.translatesAutoresizingMaskIntoConstraints = false
        handleView.heightAnchor.constraint(equalToConstant: 4.0).isActive = true
        handleView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        topStackView.addArrangedSubview(CenterView(arrangedSubview: handleView, axis: .horizontal))
        containerView.addArrangedSubview(topStackView)

        containerView.setCustomSpacing(8, after: topStackView)
        
        if let titleLabel = titleLabel {
            titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
            topStackView.addArrangedSubview(titleLabel)
        }

        let contentStackView = FittingCompressedScrollStackView(arrangedSubviews: [])
        contentStackView.axis = .vertical
        contentStackView.showsVerticalScrollIndicator = false
        containerView.addArrangedSubview(contentStackView)
        
        // Header section for sheet information
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.distribution = .fill
        headerStackView.alignment = .leading
        headerStackView.spacing = 8.0
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addArrangedSubview(headerStackView)

        if let subtitleLabel = subtitleLabel {
            headerStackView.addArrangedSubview(subtitleLabel)
            subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        }

        if let descriptionLabel = descriptionLabel {
            headerStackView.addArrangedSubview(descriptionLabel)
            descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        }

        // Section for every item in sheet request content
        
        for content in config.content {
            contentStackView.addArrangedSubview(
                ListFragmentView(
                    sheetList: content,
                    didTapItem: { [weak self] tapItem in
                        guard let s = self else { return }
                        s.handleListRowTapped(content, rowTapped: tapItem)
                    }
                )
            )
        }

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 && scrollView.isTracking {
            let percentage = 2 * -scrollView.contentOffset.y / scrollView.frame.height
            delegate?.sheetViewController(self, didDrag: percentage)
        }
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegate?.sheetViewControllerDidStartDragging(self)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegate?.sheetViewControllerDidEndDragging(self)
    }
}

private extension SheetViewController {
    @objc func didPan(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began {
            panGestureBeginningY = gesture.translation(in: view).y
            delegate?.sheetViewControllerDidStartDragging(self)
        } else if gesture.state == .changed {
            let y = max(0, gesture.translation(in: view).y)
            let percentage = y / view.frame.height
            delegate?.sheetViewController(self, didDrag: percentage)
        } else {
            panGestureBeginningY = 0 // just sanitizing it...
            delegate?.sheetViewControllerDidEndDragging(self)
        }
    }
    
    func handleListRowTapped(_ sheetList: SheetList, rowTapped: ListFragmentView.ItemTappedType) {
        if !isDismissing && sheetList.autoSubmit {
            isDismissing = true
            
            switch rowTapped {
            case .action(let item):
                sheetSelectionResponse = .init(action: .dismiss, selectedIds: [.init(id: sheetList.id, selected: [item.id])])
            case .informative:
                sheetSelectionResponse = .init(action: .dismiss, selectedIds: [])
            case .singleSelection(let item):
                sheetSelectionResponse = .init(action: .dismiss, selectedIds: [.init(id: sheetList.id, selected: [item.id])])
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
                guard let s = self else { return }
                s.dismiss(animated: true)
            }
        }
        
    }
}

private class FittingCompressedScrollStackView: ScrollStackView {
    override var intrinsicContentSize: CGSize {
        stackView.systemLayoutSizeFitting(
            CGSize(
                width: UIScreen.main.bounds.width,
                height: UIView.layoutFittingCompressedSize.height
            ),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )
    }
}
