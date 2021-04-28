//
//  UICatalogControlsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum UIControlRow: Int, CaseIterable {
    case `switch`
    case segmentedControl
    case tabBar
    case pageControl
    case radioButton
    case checkbox
}

class UICatalogControlsViewController: UITableViewController {
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

        title = "Controls"

        tableView.allowsSelection = false
        tableView.delaysContentTouches = false
    }

    override func numberOfSections(in _: UITableView) -> Int {
        UIControlRow.allCases.count
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        UIControlRow.allCases[section].title
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let control = UIControlRow.allCases[indexPath.section]
        let cell = UITableViewCell()

        configureCell(cell, for: control)

        return cell
    }
}

private extension UIControlRow {
    var title: String {
        switch self {
        case .switch:
            return "UISwitch"
        case .segmentedControl:
            return "UISegmentedControl"
        case .tabBar:
            return "UITabBar"
        case .pageControl:
            return "UIPageControl"
        case .radioButton:
            return "RadioButton"
        case .checkbox:
            return "Checkbox"
        }
    }
}

private extension UICatalogControlsViewController {
    func configureCell(_ cell: UITableViewCell, for control: UIControlRow) {
        let controlView: UIView

        switch control {
        case .switch:
            controlView = configureForSwitch()
        case .segmentedControl:
            controlView = configureForSegmentedControl()
        case .tabBar:
            controlView = configureForTabBar()
        case .pageControl:
            controlView = configureForPageIndicator()
        case .checkbox:
            controlView = configureCheckbox()
        case .radioButton:
            controlView = configureRadioButton()
        }

        cell.backgroundColor = .backgroundContainer
        cell.contentView.addSubview(controlView, constraints: [
            controlView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            controlView.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor)
        ])
    }

    func configureForSwitch() -> UIView {
        let offSwitch = UISwitch()
        offSwitch.isOn = false
        
        let onSwitch = UISwitch()
        onSwitch.isOn = true
        
        return stackView(arrangedSubviews: [offSwitch, onSwitch])
    }

    func configureForSegmentedControl() -> UIView {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Segment 1", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Segment 2", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Segment 3", at: 2, animated: true)

        segmentedControl.selectedSegmentIndex = 1

        return segmentedControl
    }

    func configureForTabBar() -> UIView {
        let button = Button(title: "Show tabBar")

        button.addTarget(self, action: #selector(showTabBarButtonTapped), for: .touchUpInside)

        return button
    }

    @objc func showTabBarButtonTapped() {
        present(TabBarSampleViewController(), animated: true, completion: nil)
    }

    func configureForPageIndicator() -> UIView {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 2

        return pageControl
    }

    func configureCheckbox() -> UIView {
        let nonChecked = Checkbox()
        nonChecked.isChecked = false
        
        let checked = Checkbox()
        checked.isChecked = true
        
        return stackView(arrangedSubviews: [nonChecked, checked])
    }

    func configureRadioButton() -> UIView {
        let deactivated = RadioButton()
        deactivated.isActivated = false
        
        let activated = RadioButton()
        activated.isActivated = true
        
        return stackView(arrangedSubviews: [deactivated, activated])
    }
    
    func stackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackview = UIStackView(arrangedSubviews: arrangedSubviews)
        stackview.spacing = 10
        return stackview
    }
}

// MARK: TabBarSampleViewController

private class TabBarSampleViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        var tabs = [UIViewController]()

        for i in 0 ..< 3 {
            let viewController = TabViewController(text: "Tab \(i)")
            viewController.tabBarItem = UITabBarItem()
            viewController.tabBarItem.title = "Tab \(i)"
            viewController.tabBarItem.image = UIImage.tabItemIcon.withRenderingMode(.alwaysOriginal)

            tabs.append(viewController)
        }

        viewControllers = tabs
    }
}

private class TabViewController: UIViewController {
    private let text: String

    init(text: String) {
        self.text = text

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        view = UIView()
        view.backgroundColor = .background

        let label = UILabel()
        label.font = .textPreset4(weight: .medium)
        label.textColor = .textPrimary
        label.text = text

        view.addSubview(label, constraints: [
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
