//
//  UICatalogFontsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import UIKit

class UICatalogFontsViewController: UITableViewController {
    typealias FontType = (fontStyle: FontStyle, weight: String)

    private let fonts: [FontType] = [
        (FontStyle.textPreset1, FontStyle.TextPreset1Weight.light.rawValue),
        (FontStyle.textPreset2, FontStyle.TextPreset2Weight.light.rawValue),
        (FontStyle.textPreset3, FontStyle.TextPreset3Weight.light.rawValue),
        (FontStyle.textPreset4, FontStyle.TextPreset4Weight.light.rawValue),
        (FontStyle.textPreset5, FontStyle.TextPreset5Weight.light.rawValue),
        (FontStyle.textPreset5, FontStyle.TextPreset5Weight.medium.rawValue),
        (FontStyle.textPreset6, FontStyle.TextPreset6Weight.light.rawValue),
        (FontStyle.textPreset6, FontStyle.TextPreset6Weight.regular.rawValue),
        (FontStyle.textPreset6, FontStyle.TextPreset6Weight.medium.rawValue),
        (FontStyle.textPreset7, FontStyle.TextPreset7Weight.regular.rawValue),
        (FontStyle.textPreset7, FontStyle.TextPreset7Weight.medium.rawValue),
        (FontStyle.textPreset8, FontStyle.TextPreset8Weight.regular.rawValue),
        (FontStyle.textPreset8, FontStyle.TextPreset8Weight.medium.rawValue),
        (FontStyle.textSystem, FontStyle.TextSystemWeight.regular.rawValue)
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
