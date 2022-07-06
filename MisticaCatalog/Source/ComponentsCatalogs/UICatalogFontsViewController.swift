//
//  UICatalogFontsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit
import Shared

class UICatalogFontsViewController: UITableViewController {
    typealias FontType = (fontStyle: FontStyle, weight: String)

    private let fonts: [FontType] = [
        (fontStyle: FontStyle.textPreset1, weight: FontStyle.TextPreset1Weight.regular.rawValue),
        (fontStyle: FontStyle.textPreset1, weight: FontStyle.TextPreset1Weight.medium.rawValue),
        (fontStyle: FontStyle.textPreset2, weight: FontStyle.TextPreset2Weight.regular.rawValue),
        (fontStyle: FontStyle.textPreset2, weight: FontStyle.TextPreset2Weight.medium.rawValue),
        (fontStyle: FontStyle.textPreset3, weight: FontStyle.TextPreset3Weight.light.rawValue),
        (fontStyle: FontStyle.textPreset3, weight: FontStyle.TextPreset3Weight.regular.rawValue),
        (fontStyle: FontStyle.textPreset3, weight: FontStyle.TextPreset3Weight.medium.rawValue),
        (fontStyle: FontStyle.textPreset4, weight: FontStyle.TextPreset4Weight.light.rawValue),
        (fontStyle: FontStyle.textPreset4, weight: FontStyle.TextPreset4Weight.regular.rawValue),
        (fontStyle: FontStyle.textPreset4, weight: FontStyle.TextPreset4Weight.medium.rawValue),
        (fontStyle: FontStyle.textPreset5, weight: FontStyle.TextPreset5Weight.light.rawValue),
        (fontStyle: FontStyle.textPreset6, weight: FontStyle.TextPreset6Weight.light.rawValue),
        (fontStyle: FontStyle.textPreset7, weight: FontStyle.TextPreset7Weight.light.rawValue),
        (fontStyle: FontStyle.textPreset8, weight: FontStyle.TextPreset8Weight.light.rawValue),
        (fontStyle: FontStyle.textPreset9, weight: FontStyle.TextPreset9Weight.light.rawValue),
        (fontStyle: FontStyle.textPreset10, weight: FontStyle.TextPreset10Weight.light.rawValue)
    ]

    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fonts"

        tableView.allowsSelection = false
        tableView.delaysContentTouches = false
    }

    override func numberOfSections(in _: UITableView) -> Int {
        fonts.count
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCell(at: indexPath)
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        let fontType = fonts[section]

        return "\(fontType.fontStyle.description) \(fontType.weight)"
    }

    func configureCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showTooltip")
        let fontStyle = fonts[indexPath.section].fontStyle
        let fontWeight = fonts[indexPath.section].weight
        let preferredContentSizeCategory = UIScreen.main.traitCollection.preferredContentSizeCategory

        cell.textLabel?.text = "lorem ipsum dolor"
        cell.textLabel?.font = .preferredFont(for: fontStyle, weight: fontWeight.systemWeight, constrainedToPreferredSize: preferredContentSizeCategory)
        cell.textLabel?.numberOfLines = 0

        return cell
    }
}

private extension String {
    var systemWeight: UIFont.Weight {
        switch self {
        case "light":
            return .light
        case "regular":
            return .regular
        case "medium":
            return .medium
        default:
            assertionFailure("TextPreset should be an instance of light, regular or medium")
            return .light
        }
    }
}
