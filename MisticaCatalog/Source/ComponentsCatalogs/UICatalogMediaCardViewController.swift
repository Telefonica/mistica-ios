//
//  UICatalogMediaCardViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case richMedia
    case headline
    case pretitle
    case pretitleColor
    case title
    case description
    case buttons
    case show
}

class UICatalogMediaCardViewController: UIViewController {
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var richMediaCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "RichMediaCell")

        cell.segmentedControl.insertSegment(withTitle: "Image", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Custom View", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var headlineCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Headline")
        cell.textField.text = "headline"
        return cell
    }()

    private lazy var pretitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Pretitle")
        cell.textField.text = "movistar likes"
        return cell
    }()
    
    private lazy var pretitleColorsCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "PretitleColor")
        
        cell.segmentedControl.insertSegment(withTitle: "Black", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Green", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Red", at: 2, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Blue", at: 3, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Title")
        cell.textField.text = "Item title"
        return cell
    }()

    private lazy var descriptionCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Description")
        cell.textField.text = "This is a description"
        return cell
    }()

    private lazy var buttonsCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ActionButtonStyleCell")

        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Link", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Primary", at: 2, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Both", at: 3, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var showCardCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ShowCardCell")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Card"
        return cell
    }()

    private lazy var cells = [
        [richMediaCell],
        [headlineCell],
        [pretitleCell],
        [pretitleColorsCell],
        [titleCell],
        [descriptionCell],
        [buttonsCell],
        [showCardCell]
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
        title = "MediaCard"

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
}

extension UICatalogMediaCardViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)!.headerTitle
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells[section].count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cells[indexPath.section][indexPath.row]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == cells.indices.last! else { return }
        tableView.deselectRow(animated: true)

        let vc = MediaCardViewSampleViewController()

        let richMedia: UIView

        if richMediaCell.segmentedControl.selectedSegmentIndex == 0 {
            richMedia = UIImageView(image: .avengersMovieLogo)
            richMedia.heightAnchor.constraint(equalToConstant: 150).isActive = true
            richMedia.contentMode = .scaleAspectFill
        } else {
            let containerView = UIView()
            containerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            containerView.backgroundColor = .gray

            let label = UILabel()
            label.text = "Custom Media Item"

            containerView.addSubview(withCenterConstraints: label)

            richMedia = containerView
        }

        let button: CardButton?
        let linkButton: CardLinkButton?

        switch buttonsCell.segmentedControl.selectedSegmentIndex {
        case 0:
            button = nil
            linkButton = nil
        case 1:
            button = nil
            linkButton = CardLinkButton(title: "Link", tapHandler: nil)
        case 2:
            button = CardButton(title: "Button", loadingTitle: "Loading", tapHandler: nil)
            linkButton = nil
        case 3:
            button = CardButton(title: "Button", loadingTitle: "Loading", tapHandler: nil)
            linkButton = CardLinkButton(title: "Link", tapHandler: nil)
        default:
            fatalError("Case not implemented")
        }
        
        let color: UIColor?
        
        switch pretitleColorsCell.segmentedControl.selectedSegmentIndex {
        case 0:
            color = .black
        case 1:
            color = .green
        case 2:
            color = .red
        case 3:
            color = .blue
        default:
            fatalError("Case not implemented")
        }

        let configuration = MediaCardConfiguration(
            richMedia: richMedia,
            headline: headlineCell.textField.text.valueOrNil,
            title: titleCell.textField.text.valueOrNil,
            pretitle: pretitleCell.textField.text.valueOrNil,
            pretitleColor: color,
            descriptionTitle: descriptionCell.textField.text.valueOrNil ?? "Mandatory field",
            button: button,
            link: linkButton
        )

        vc.card.contentConfiguration = configuration

        show(vc, sender: self)
    }
}

private class MediaCardViewSampleViewController: UIViewController {
    var card = MediaCard()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

        view.addSubview(card, constraints: [
            card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            card.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MediaCard"
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .richMedia:
            return "Rich Media"
        case .headline:
            return "Headline"
        case .pretitle:
            return "Pretitle"
        case .pretitleColor:
            return "Pretitle color"
        case .title:
            return "Title"
        case .description:
            return "Description"
        case .buttons:
            return "Buttons"
        case .show:
            return "Show"
        }
    }
}

private extension Optional where Wrapped == String {
    var valueOrNil: String? {
        isEmpty ? nil : self
    }
}
