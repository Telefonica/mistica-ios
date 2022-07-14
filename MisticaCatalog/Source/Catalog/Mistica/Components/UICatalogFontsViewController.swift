//
//  UICatalogFontsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import MisticaCommon
import UIKit

class UICatalogFontsViewController: UITableViewController {
    typealias FontType = (font: UIFont, name: String)

    private let fonts: [FontType] = [
        (font: .textPreset1(weight: .regular, constrainedToPreferredSize: .mainScreenSize), name: "textPreset1(weight: .regular)"),
        (font: .textPreset1(weight: .medium, constrainedToPreferredSize: .mainScreenSize), name: "textPreset1(weight: .medium)"),
        (font: .textPreset2(weight: .regular, constrainedToPreferredSize: .mainScreenSize), name: "textPreset2(weight: .regular)"),
        (font: .textPreset2(weight: .medium, constrainedToPreferredSize: .mainScreenSize), name: "textPreset2(weight: .medium)"),
        (font: .textPreset3(weight: .light, constrainedToPreferredSize: .mainScreenSize), name: "textPreset3(weight: .light)"),
        (font: .textPreset3(weight: .regular, constrainedToPreferredSize: .mainScreenSize), name: "textPreset3(weight: .regular)"),
        (font: .textPreset3(weight: .medium, constrainedToPreferredSize: .mainScreenSize), name: "textPreset3(weight: .medium)"),
        (font: .textPreset4(weight: .light, constrainedToPreferredSize: .mainScreenSize), name: "textPreset4(weight: .light)"),
        (font: .textPreset4(weight: .regular, constrainedToPreferredSize: .mainScreenSize), name: "textPreset4(weight: .regular)"),
        (font: .textPreset4(weight: .medium, constrainedToPreferredSize: .mainScreenSize), name: "textPreset4(weight: .medium)"),
        (font: .textPreset5(constrainedToPreferredSize: .mainScreenSize), name: "textPreset5()"),
        (font: .textPreset6(constrainedToPreferredSize: .mainScreenSize), name: "textPreset6()"),
        (font: .textPreset7(constrainedToPreferredSize: .mainScreenSize), name: "textPreset7()"),
        (font: .textPreset8(constrainedToPreferredSize: .mainScreenSize), name: "textPreset8()"),
        (font: .textPreset9(constrainedToPreferredSize: .mainScreenSize), name: "textPreset9()"),
        (font: .textPreset10(constrainedToPreferredSize: .mainScreenSize), name: "textPreset10()")
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
        return fontType.name
    }

    func configureCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showTooltip")
        let font = fonts[indexPath.section].font

        cell.textLabel?.text = "lorem ipsum dolor"
        cell.textLabel?.font = font
        cell.textLabel?.numberOfLines = 0

        return cell
    }
}

extension UIContentSizeCategory {
    static let mainScreenSize = UIScreen.main.traitCollection.preferredContentSizeCategory
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
