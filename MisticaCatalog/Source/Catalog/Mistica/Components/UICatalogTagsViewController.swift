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
    case inverseSelector
    case tagsCatalog
    case tagsWithIconCatalog
}

private enum Constants {
    enum Container {
        static let margin: CGFloat = 25
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
    private lazy var tagViews: [TagView] = TagStyle.allCases.map {
        TagView(
            text: $0.rawValue,
            style: $0,
            isInverse: inverseSelectorCell.isOn
        )
    }

    private lazy var tagViewsWithImages: [TagView] = TagStyle.allCases.map {
        TagView(
            text: $0.rawValue,
            style: $0,
            isInverse: inverseSelectorCell.isOn,
            icon: UIImage(systemName: Constants.defaultIconName)
        )
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

    private lazy var inverseSelectorCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "inverseSelector")
        cell.textLabel?.text = "Is inverse?"

        cell.didValueChange = switchDidChange

        return cell
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
        if indexPath.section == Section.content.rawValue {
            return contentCell
        } else if indexPath.section == Section.inverseSelector.rawValue {
            return inverseSelectorCell
        } else if indexPath.section == Section.tagsCatalog.rawValue {
            return tagViewsCell(with: tagViews)
        } else if indexPath.section == Section.tagsWithIconCatalog.rawValue {
            return tagViewsCell(with: tagViewsWithImages)
        } else {
            fatalError()
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
        cell.configure(with: tags)
        cell.contentView.backgroundColor = inverseSelectorCell.isOn ? .navigationBarBackground : .backgroundContainer
        return cell
    }

    @objc func textDidChange(_ textField: UITextField) {
        (tagViews + tagViewsWithImages).forEach { $0.text = textField.text }
    }

    func switchDidChange(_ uiSwitch: UISwitch) {
        (tagViews + tagViewsWithImages).forEach { $0.isInverse = uiSwitch.isOn }
        tableView.reloadSections(
            IndexSet([Section.tagsCatalog.rawValue, Section.tagsWithIconCatalog.rawValue]),
            with: .automatic
        )
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
        case .inverseSelector: return "Default/Inverse mode"
        case .tagsCatalog: return "Tags catalog"
        case .tagsWithIconCatalog: return "Tags with icon catalog"
        }
    }
}
