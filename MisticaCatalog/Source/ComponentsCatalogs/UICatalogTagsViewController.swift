//
//  UICatalogTagsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case content
    case result
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

    static let defaultContent = "Promoción"
}

class UICatalogTagsViewController: UIViewController {
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

    private lazy var resultCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "result")

        // Fake container in this cell
        let container = UIView()
        container.makeRounded(cornerRadius: Constants.Container.cornerRadius)

        container.backgroundColor = .skeletonBackground
        cell.contentView.addSubview(container, constraints: [
            cell.contentView.topAnchor.constraint(
                equalTo: container.topAnchor,
                constant: -Constants.Container.margin
            ),
            cell.contentView.bottomAnchor.constraint(
                equalTo: container.bottomAnchor,
                constant: Constants.Container.margin
            ),
            cell.contentView.leadingAnchor.constraint(
                equalTo: container.leadingAnchor,
                constant: -Constants.Container.margin
            ),
            cell.contentView.trailingAnchor.constraint(
                equalTo: container.trailingAnchor,
                constant: Constants.Container.margin
            )
        ])

        // Tag in this container
        container.addSubview(tag, constraints: [
            container.topAnchor.constraint(
                equalTo: tag.topAnchor,
                constant: -Constants.Tag.topMargin
            ),
            container.bottomAnchor.constraint(
                greaterThanOrEqualTo: tag.bottomAnchor,
                constant: Constants.Tag.minBottomMargin
            ),
            container.leadingAnchor.constraint(
                equalTo: tag.leadingAnchor,
                constant: -Constants.Tag.leadingMargin
            ),
            container.trailingAnchor.constraint(
                greaterThanOrEqualTo: tag.trailingAnchor,
                constant: Constants.Tag.minTrailingMargin
            )
        ])

        return cell
    }()

    private lazy var cells = [contentCell, resultCell]

    private lazy var tag = TagView(text: Constants.defaultContent)

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

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cells[indexPath.section]
    }
}

extension UICatalogTagsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

private extension UICatalogTagsViewController {
    @objc func textDidChange(_ textField: UITextField) {
        tag.text = textField.text
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .content: return "Tag content"
        case .result: return "Result"
        }
    }
}
