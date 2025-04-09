//
//  UICatalogButtonsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

class UICatalogButtonsViewController: UITableViewController {
    private enum Constants {
        static let exampleImage = UIImage(named: "Alerts")!
        static let states: [Button.State] = [.normal, .selected, .disabled, .loading]
        static var styles: [Style] {
            [
                Style(buttonStyle: .primary, title: "Primary", isInverse: false, isSmall: false),
                Style(buttonStyle: .secondary, title: "Secondary", isInverse: false, isSmall: false),
                Style(buttonStyle: .danger, title: "Danger", isInverse: false, isSmall: false),
                Style(buttonStyle: .link, title: "Link", isInverse: false, isSmall: false),
                Style(buttonStyle: .linkDanger, title: "Link Danger", isInverse: false, isSmall: false),
                Style(buttonStyle: .primaryInverse, title: "Primary Inverse", isInverse: true, isSmall: false),
                Style(buttonStyle: .secondaryInverse, title: "Secondary Inverse", isInverse: true, isSmall: false),
                Style(buttonStyle: .linkInverse, title: "Link Inverse", isInverse: true, isSmall: false),
                Style(buttonStyle: .linkDangerInverse, title: "Link Danger Inverse", isInverse: true, isSmall: false),

                // Small variants

                Style(buttonStyle: .primary, title: "Primary S", isInverse: false, isSmall: true),
                Style(buttonStyle: .secondary, title: "Secondary S", isInverse: false, isSmall: true),
                Style(buttonStyle: .danger, title: "Danger S", isInverse: false, isSmall: true),
                Style(buttonStyle: .primaryInverse, title: "Primary Inverse S", isInverse: true, isSmall: true),
                Style(buttonStyle: .secondaryInverse, title: "Secondary Inverse S", isInverse: true, isSmall: true),

                // Chevron

                Style(buttonStyle: .link, title: "Chevron", isInverse: false, isSmall: false, rightImage: .chevron),

                // Images

                Style(buttonStyle: .primary, title: "Left image", isInverse: false, isSmall: false, leftImage: .custom(image: exampleImage), rightImage: nil),
                Style(buttonStyle: .primary, title: "Right image", isInverse: false, isSmall: false, leftImage: nil, rightImage: .custom(image: exampleImage)),
                Style(buttonStyle: .primary, title: "Both images", isInverse: false, isSmall: false, leftImage: .custom(image: exampleImage), rightImage: .custom(image: exampleImage))
            ]
        }

        @MainActor static let additionalButtonSections: [(name: String, buttons: [Button], contentMode: UIView.ContentMode)] = [
            ("Min width", [
                Button(style: .primary, title: "OK"),
                Button(style: .primary, title: "OK", isSmall: true),
                Button(style: .link, title: "OK")
            ], .center),
            ("Padding", [
                Button(style: .primary, title: "Some very large title"),
                Button(style: .primary, title: "Some very large title", isSmall: true),
                Button(style: .link, title: "Some very large title")
            ], .center),
            ("Left Bleeding Alignment", [
                Button(style: .primary, title: "OK"),
                Button(style: .primary, title: "OK", isSmall: true),
                Button(style: .link, title: "OK")
            ], .left),
            ("Right Bleeding Alignment", [
                Button(style: .primary, title: "OK"),
                Button(style: .primary, title: "OK", isSmall: true),
                Button(style: .link, title: "OK")
            ], .right)
        ]
    }

    private struct Style {
        let buttonStyle: Button.Style
        let title: String
        let isInverse: Bool
        let isSmall: Bool
        let leftImage: Button.LeftImage?
        let rightImage: Button.RightImage?

        init(buttonStyle: Button.Style,
             title: String,
             isInverse: Bool,
             isSmall: Bool,
             leftImage: Button.LeftImage? = nil,
             rightImage: Button.RightImage? = nil) {
            self.buttonStyle = buttonStyle
            self.title = title
            self.isInverse = isInverse
            self.isSmall = isSmall
            self.leftImage = leftImage
            self.rightImage = rightImage
        }
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

        tableView.allowsSelection = false
        tableView.delaysContentTouches = false
    }

    override func numberOfSections(in _: UITableView) -> Int {
        Constants.styles.count + Constants.additionalButtonSections.count
    }

    func isStyleSection(_ section: Int) -> Bool {
        Constants.styles.indices.contains(section)
    }

    func additionalButtonSection(at section: Int) -> (name: String, buttons: [Button], contentMode: UIView.ContentMode) {
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

        let button = state.makeButton(
            style: style.buttonStyle,
            title: "Title",
            loadingTitle: "Loading Title",
            isSmall: style.isSmall,
            leftImage: style.leftImage,
            rightImage: style.rightImage
        )
        cell.configure(with: button)
        cell.contentView.setMisticaColorBackground(style.isInverse ? .backgroundBrand : .solid(.backgroundContainer))

        return cell
    }

    func additionalCell(at indexPath: IndexPath) -> UITableViewCell {
        let buttonCategory = additionalButtonSection(at: indexPath.section)
        let button = buttonCategory.buttons[indexPath.row]
        button.contentMode = buttonCategory.contentMode

        let cell = UITableViewCell()
        cell.configure(with: button, contentMode: buttonCategory.contentMode)

        return cell
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        isStyleSection(section) ? Constants.styles[section].title : additionalButtonSection(at: section).name
    }
}

private extension UITableViewCell {
    func configure(with button: Button, contentMode: UIView.ContentMode = .center) {
        let alignmentConstraint: NSLayoutConstraint
        switch contentMode {
        case .left:
            alignmentConstraint = contentView.leftAnchor.constraint(equalTo: button.leftAnchor)
        case .right:
            alignmentConstraint = contentView.rightAnchor.constraint(equalTo: button.rightAnchor)
        default:
            alignmentConstraint = contentView.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        }

        contentView.addSubview(button, constraints: [
            contentView.layoutMarginsGuide.topAnchor.constraint(equalTo: button.topAnchor),
            contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: button.bottomAnchor),
            alignmentConstraint
        ])
    }
}

private class LoadSimulationButton: Button {
    override init(
        style: Button.Style = .primary,
        title: String,
        leftImage: LeftImage? = nil,
        rightImage: RightImage? = nil,
        loadingTitle: String? = nil,
        isSmall: Bool = false
    ) {
        super.init(style: style, title: title, leftImage: leftImage, rightImage: rightImage, loadingTitle: loadingTitle, isSmall: isSmall)
        addTarget(self, action: #selector(simulateLoad), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func simulateLoad() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
        }
    }
}

private extension Button.State {

    @MainActor func makeButton(
        style: Button.Style,
        title _: String,
        loadingTitle _: String,
        isSmall: Bool,
        leftImage: Button.LeftImage?,
        rightImage: Button.RightImage?
    ) -> Button {
        let button: Button

        switch self {
        case .selected:
            button = Button(
                style: style,
                title: "Title",
                leftImage: leftImage,
                rightImage: rightImage,
                loadingTitle: "Loading Title",
                isSmall: isSmall
            )
            button.title = "Selected"
            button.isSelected = true
            button.isUserInteractionEnabled = false
        case .disabled:
            button = Button(
                style: style,
                title: "Title",
                leftImage: leftImage,
                rightImage: rightImage,
                loadingTitle: "Loading Title",
                isSmall: isSmall
            )
            button.title = "Disabled"
            button.isEnabled = false
        case .loading:
            button = LoadSimulationButton(
                style: style,
                title: "Loading",
                leftImage: leftImage,
                rightImage: rightImage,
                loadingTitle: "Loading Title",
                isSmall: isSmall
            )
        case .normal:
            button = Button(
                style: style,
                title: "Title",
                leftImage: leftImage,
                rightImage: rightImage,
                loadingTitle: "Loading Title",
                isSmall: isSmall
            )
            button.title = "Normal"
        default:
            fatalError("Unknown state")
        }

        return button
    }
}
