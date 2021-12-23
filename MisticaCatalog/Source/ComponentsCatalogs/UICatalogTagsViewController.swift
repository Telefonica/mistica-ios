//
//  UICatalogTagsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case content
    case tagsCatalog
    case tagsWithIconCatalog
    case inverseTagsCatalog
}

private enum Constants {
    enum Container {
        static let margin: CGFloat = 25
        static let cornerRadius: CGFloat = 4
    }
    
    enum Tag {
        static let topMargin: CGFloat = 16
        static let leadingMargin: CGFloat = 16
        static let minBottomMargin: CGFloat = 100
        static let minTrailingMargin: CGFloat = 16
    }

    static let defaultContent = "Tag text"
    static let defaultIconName = "star.fill"
}

class UICatalogTagsViewController: UIViewController {
    private var tagViews: [TagView] {
        [tagPromo, tagActive, tagInactive, tagSuccess, tagWarning, tagError]
    }
    
    private var tagViewsWithImages: [TagView] {
        [tagPromoWithIcon, tagActiveWithIcon, tagInactiveWithIcon, tagSuccessWithIcon, tagWarningWithIcon, tagErrorWithIcon]
    }
    
    private var tagViewsInverse: [TagView] {
        [tagInverse]
    }
    
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var contentCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "content")
        cell.textField.text = Constants.defaultContent
        cell.textField.placeholder = "Empty"
        cell.textField.returnKeyType = .done

        cell.textField.delegate = self
        cell.textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

        return cell
    }()

    private lazy var tagPromo = TagView(text: "Promo", style: .promo)
    private lazy var tagActive = TagView(text: "Active", style: .active)
    private lazy var tagInactive = TagView(text: "Inactive", style: .inactive)
    private lazy var tagSuccess = TagView(text: "Success", style: .success)
    private lazy var tagWarning = TagView(text: "Warning", style: .warning)
    private lazy var tagError = TagView(text: "Error", style: .error)
    
    private lazy var tagPromoWithIcon = TagView(text: "Promo", style: .promo, icon: UIImage(systemName: Constants.defaultIconName))
    private lazy var tagActiveWithIcon = TagView(text: "Active", style: .active, icon: UIImage(systemName: Constants.defaultIconName))
    private lazy var tagInactiveWithIcon = TagView(text: "Inactive", style: .inactive, icon: UIImage(systemName: Constants.defaultIconName))
    private lazy var tagSuccessWithIcon = TagView(text: "Success", style: .success, icon: UIImage(systemName: Constants.defaultIconName))
    private lazy var tagWarningWithIcon = TagView(text: "Warning", style: .warning, icon: UIImage(systemName: Constants.defaultIconName))
    private lazy var tagErrorWithIcon = TagView(text: "Error", style: .error, icon: UIImage(systemName: Constants.defaultIconName))
    
    private lazy var tagInverse = TagView(text: "Inverse", style: .inverse)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tags"

        view.addSubview(withDefaultConstraints: tableView)
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.keyboardDismissMode = .interactive
    }
}

extension UICatalogTagsViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)!.headerTitle
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return contentCell
        } else if indexPath.section == 1 {
            return tagViewsCell(with: tagViews)
        } else if indexPath.section == 2 {
            return tagViewsCell(with: tagViewsWithImages)
        } else {
            return tagViewsCell(with: tagViewsInverse)
        }
    }
}

extension UICatalogTagsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

private extension UICatalogTagsViewController {
    private func tagViewsCell(with tags: [TagView]) -> UITableViewCell {
        let cell = UITableViewCell()
        let hasInverseTags = tags.filter { $0.style == .inverse }.count > 0
        cell.configure(with: tags)
        cell.contentView.backgroundColor = hasInverseTags ? .navigationBarBackground : .backgroundContainer
        return cell
    }
    
    @objc func textDidChange(_ textField: UITextField) {
        tagPromo.text = textField.text
        tagActive.text = textField.text
        tagInactive.text = textField.text
        tagSuccess.text = textField.text
        tagWarning.text = textField.text
        tagError.text = textField.text
        
        tagPromoWithIcon.text = textField.text
        tagActiveWithIcon.text = textField.text
        tagInactiveWithIcon.text = textField.text
        tagSuccessWithIcon.text = textField.text
        tagWarningWithIcon.text = textField.text
        tagErrorWithIcon.text = textField.text
        
        tagInverse.text = textField.text
    }
}

private extension UITableViewCell {
    func configure(with tagViews: [TagView]) {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        tagViews.forEach { stackView.addArrangedSubview($0) }
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: stackView)
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .content: return "Custom tag content"
        case .tagsCatalog: return "Tags catalog"
        case .tagsWithIconCatalog: return "Tags with icon catalog"
        case .inverseTagsCatalog: return "Inverse tags catalog"
        }
    }
}
