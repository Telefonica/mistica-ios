//
//  UICatalogTextLinkViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case text
    case links
    case linkPositionCell
    case example
}

class UICatalogTextLinkViewController: UIViewController {
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var textCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "text")
        cell.textField.text = "Tap here to see the link"
        cell.textField.placeholder = "Empty"
        cell.textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return cell
    }()

    private lazy var linkCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "linkCell")
        cell.textField.text = "here"
        cell.textField.placeholder = "Empty"
        cell.textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return cell
    }()

    var linkIndices: [Int]? {
        guard let text = linkPositionCell.textField.text, !text.isEmpty else { return nil }
        let parts = text.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        return parts.compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
    }

    private lazy var linkPositionCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "linkPositionCell")
        cell.textField.text = "0"
        cell.textField.placeholder = "Empty"
        cell.textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return cell
    }()

    private lazy var cells = [
        [textCell],
        [linkCell],
        [linkPositionCell]
    ]

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
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard(_: UITapGestureRecognizer) {
        cells.flatMap { $0 }.forEach { cell in
            guard let textFieldCell = cell as? UITextFieldTableViewCell else { return }
            textFieldCell.textField.resignFirstResponder()
        }
    }

    @objc private func textDidChange() {
        tableView.reloadSections(IndexSet(integer: Section.example.rawValue), with: .automatic)
    }
}

extension UICatalogTextLinkViewController: UITableViewDataSource, UITableViewDelegate {
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
        let section = Section(rawValue: indexPath.section)!
        switch section {
        case .example:
            let linkedWords: [LinkedWord] = zip(links ?? [], linkIndices ?? []).map { link, index in
                LinkedWord(word: link, matchIndex: index)
            }

            let textLink = TextLink(fullText: text ?? "", linkedWords: linkedWords)
            textLink.linkDelegate = self
            return CellView(textLink: textLink, reuseIdentifier: "TextLink")
        default:
            return cells[indexPath.section][indexPath.row]
        }
    }
}

extension UICatalogTextLinkViewController: TextLinkDelegate {
    func textLink(_ view: TextLink, tappedWord: String, matchIndex: String) {
        let config = SnackbarConfig(
            title: tappedWord + matchIndex,
            dismissInterval: .fiveSeconds,
            forceDismiss: false
        )
        SnackbarController.shared.showSnackbar(
            config: config,
            style: .info,
            dismissHandler: { reason in
                print("\(reason.rawValue)")
            }
        )
    }
}

private extension UICatalogTextLinkViewController {
    var text: String? {
        guard let text = textCell.textField.text, !text.isEmpty else { return nil }
        return text
    }

    var links: [String]? {
        guard let links = linkCell.textField.text, !links.isEmpty else { return nil }
        let separatedLinks = links.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        return separatedLinks
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .text: return "Text"
        case .links: return "Links"
        case .linkPositionCell: return "Link position"
        case .example: return "Example"
        }
    }
}

private class CellView: UITableViewCell {
    private let stackView: UIStackView

    public init(textLink: TextLink, reuseIdentifier: String?) {
        stackView = UIStackView(arrangedSubviews: [textLink])

        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing

        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        selectionStyle = .none
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: stackView)
    }
}
