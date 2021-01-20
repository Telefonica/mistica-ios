//
//  UICatalogHighlightedCardViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case richMedia
    case headline
    case title
    case subtitle
    case description
    case buttons
    case show
}

class UICatalogDataCardViewController: UIViewController {
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()
    
    private lazy var assetCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "RichMediaCell")
        
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Image", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Icon", at: 2, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        
        return cell
    }()
    
    private lazy var headlineCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Headline")
        cell.textField.text = "headline"
        return cell
    }()
    
    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Title")
        cell.textField.text = "Item title"
        return cell
    }()
    
    private lazy var subtitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Subtitle")
        cell.textField.text = "Subtitle"
        return cell
    }()
    
    private lazy var descriptionCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Description")
        cell.textField.text = "This is a description"
        return cell
    }()
    
    private lazy var buttonsCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ActionButtonStyleCell")
        
        cell.segmentedControl.insertSegment(withTitle: "Link", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Primary", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Primary & Link", at: 2, animated: false)
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
        [assetCell],
        [headlineCell],
        [titleCell],
        [subtitleCell],
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
        title = "DataCard"
        
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

extension UICatalogDataCardViewController: UITableViewDataSource, UITableViewDelegate {
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
        
        let vc = DataCardViewSampleViewController()
        
        let assetType: DataCardConfiguration.AssetType
        
        switch assetCell.segmentedControl.selectedSegmentIndex {
        case 0:
            assetType = .none
        case 1:
            assetType = .image(UIImage(color: .blue))
        case 2:
            assetType = .icon(UIImage(color: .gray), backgroundColor: .red)
        default:
            fatalError("Case not implemented")
        }
        
        let buttons: DataCardConfiguration.Buttons
        
        switch buttonsCell.segmentedControl.selectedSegmentIndex {
        case 0:
            buttons = .link(CardLinkButton(title: "Link", tapHandler: nil))
        case 1:
            buttons = .primary(CardButton(title: "Button", loadingTitle: "Loading", tapHandler: nil))
        case 2:
            buttons = .primaryAndLink(
                primary: CardButton(title: "Button", loadingTitle: "Loading", tapHandler: nil),
                link: CardLinkButton(title: "Link", tapHandler: nil)
            )
        default:
            fatalError("Case not implemented")
        }
        
        let configuration = DataCardConfiguration(
            asset: assetType,
            headline: headlineCell.textField.text.valueOrNil,
            title: titleCell.textField.text.valueOrNil ?? "Title is mandatory",
            subtitle: subtitleCell.textField.text.valueOrNil,
            descriptionTitle: descriptionCell.textField.text.valueOrNil ?? "Description is mandatory",
            buttons: buttons)
        
        vc.card.contentConfiguration = configuration
        
        show(vc, sender: self)
    }
}

private class DataCardViewSampleViewController: UIViewController {
    var card = DataCard()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background
        
        view.addSubview(card, constraints: [
            card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            card.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            card.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
        
        self.view = view
        self.view.backgroundColor = .darkGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DataCard"
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .richMedia:
            return "Rich Media"
        case .headline:
            return "Headline"
        case .subtitle:
            return "Subtitle"
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
        return isEmpty ? nil : self
    }
}
