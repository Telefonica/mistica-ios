//
//  UICatalogButtonsViewController.swift
//  AppCoreKit
//
//  Created by Pablo Carcelén on 26/08/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Mistica
import UIKit

class UICatalogButtonsViewController: UITableViewController {
    private enum Constants {
        static let states: [Button.State] = [.normal, .selected, .disabled, .loading]
        static var styles: [Style] {
            [
                Style(buttonStyle: .primary, title: "Primary", isInverse: false, isSmall: false),
                Style(buttonStyle: .secondary, title: "Secondary", isInverse: false, isSmall: false),
                Style(buttonStyle: .danger, title: "Danger", isInverse: false, isSmall: false),
                Style(buttonStyle: .link, title: "Link", isInverse: false, isSmall: false),
                Style(buttonStyle: .primaryInverse, title: "Primary Inverse", isInverse: true, isSmall: false),
                Style(buttonStyle: .secondaryInverse, title: "Secondary Inverse", isInverse: true, isSmall: false),
                Style(buttonStyle: .linkInverse, title: "Link Inverse", isInverse: true, isSmall: false),

                // Small variants

                Style(buttonStyle: .primary, title: "Primary S", isInverse: false, isSmall: true),
                Style(buttonStyle: .secondary, title: "Secondary S", isInverse: false, isSmall: true),
                Style(buttonStyle: .danger, title: "Danger S", isInverse: false, isSmall: true),
                Style(buttonStyle: .primaryInverse, title: "Primary Inverse S", isInverse: true, isSmall: true),
                Style(buttonStyle: .secondaryInverse, title: "Secondary Inverse S", isInverse: true, isSmall: true)
            ]
        }

        static var additionalButtonSections: [(name: String, buttons: [Button])] = [
            ("Min width", [
                Button(style: .primary, title: "OK"),
                Button(style: .primary, title: "OK", isSmall: true),
                Button(style: .link, title: "OK")
            ])
        ]
    }

    private struct Style {
        let buttonStyle: Button.Style
        let title: String
        let isInverse: Bool
        let isSmall: Bool
    }

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

        title = "Buttons"

        tableView.allowsSelection = false
        tableView.delaysContentTouches = false
    }

    override func numberOfSections(in _: UITableView) -> Int {
        Constants.styles.count + Constants.additionalButtonSections.count
    }

    func isStyleSection(_ section: Int) -> Bool {
        Constants.styles.indices.contains(section)
    }

    func additionalButtonSection(at section: Int) -> (name: String, buttons: [Button]) {
        return Constants.additionalButtonSections[section - Constants.styles.count]
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        isStyleSection(section) ? Constants.states.count : additionalButtonSection(at: section).buttons.count
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        isStyleSection(indexPath.section) ? styleCell(at: indexPath) : additionalCell(at: indexPath)
    }

    func styleCell(at indexPath: IndexPath) -> UITableViewCell {
        let style = Constants.styles[indexPath.section]
        let state = Constants.states[indexPath.row]

        let cell = UITableViewCell()

        let button = state.makeButton(style: style.buttonStyle, title: "Title", loadingTitle: "Loading Title", isSmall: style.isSmall)
        cell.configure(with: button)
        cell.contentView.backgroundColor = style.isInverse ? .backgroundBrandFirst : .white

        return cell
    }

    func additionalCell(at indexPath: IndexPath) -> UITableViewCell {
        let buttonCategory = additionalButtonSection(at: indexPath.section)
        let button = buttonCategory.buttons[indexPath.row]

        let cell = UITableViewCell()
        cell.configure(with: button)

        return cell
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        isStyleSection(section) ? Constants.styles[section].title : additionalButtonSection(at: section).name
    }
}

private extension UITableViewCell {
    func configure(with button: Button) {
        contentView.addSubview(button, constraints: [
            contentView.layoutMarginsGuide.topAnchor.constraint(equalTo: button.topAnchor),
            contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: button.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        ])
    }
}

private class LoadSimulationButton: Button {
    func configureForLoadSimulation() {
        addTarget(self, action: #selector(simulateLoad), for: .touchUpInside)
    }

    @objc func simulateLoad() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.state = .normal
        }
    }
}

private extension Button.State {
    func makeButton(style: Button.Style, title _: String, loadingTitle _: String, isSmall: Bool) -> Button {
        let button: Button

        switch self {
        case .selected:
            button = Button(style: style, title: "Title", loadingTitle: "Loading Title", isSmall: isSmall)
            button.title = "Selected"
            button.state = self
            button.isUserInteractionEnabled = false
        case .disabled:
            button = LoadSimulationButton(style: style, title: "Title", loadingTitle: "Loading Title", isSmall: isSmall)
            button.title = "Disabled"
            button.state = self
        case .loading:
            button = Button(style: style, title: "Loading", loadingTitle: "Loading Title", isSmall: isSmall)
        case .normal:
            fallthrough
        @unknown default:
            button = Button(style: style, title: "Title", loadingTitle: "Loading Title", isSmall: isSmall)
            button.title = "Normal"
            button.state = self
        }

        return button
    }
}
