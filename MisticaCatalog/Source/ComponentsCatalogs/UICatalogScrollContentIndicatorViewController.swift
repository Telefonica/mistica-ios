//
//  UICatalogScrollContentIndicatorViewController.swift
//  AppCoreKit
//
//  Created by Jose Salavert on 26/03/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Mistica
import UIKit

class UICatalogScrollContentIndicatorViewController: UIViewController {
    private let datasets = (0 ..< 25).map { "Item \($0)" }
    private let tableView = UITableView(frame: .zero)

    private lazy var button: ScrollContentIndicator = {
        let button = ScrollContentIndicator(title: "Scroll to top")
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        title = "Content Indicator"

        setUpTable()
        setUpContentIndicatorButtons()
    }

    @objc func didTapButton() {
        button.hide()
        tableView.setContentOffset(.zero, animated: true)
    }
}

private extension UICatalogScrollContentIndicatorViewController {
    func setUpTable() {
        UITableViewCell.register(on: tableView)
        view.addSubview(withDefaultConstraints: tableView)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.tableHeaderView = nil
        tableView.tableFooterView = nil
        tableView.scrollToRow(at: IndexPath(item: datasets.count - 1, section: 0), at: .bottom, animated: false)
    }

    func setUpContentIndicatorButtons() {
        button.addToView(view)
        button.show()
    }

    func firstRowIsVisible() -> Bool {
        let cellRect = tableView.rectForRow(at: IndexPath(item: 0, section: 0))
        return tableView.bounds.contains(cellRect)
    }
}

// MARK: UITableViewDelegate

extension UICatalogScrollContentIndicatorViewController: UITableViewDelegate {
    func tableView(_: UITableView, estimatedHeightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt _: IndexPath) {
        tableView.deselectRow(animated: false)
    }

    func tableView(_: UITableView, willDisplay _: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == datasets.count - 1 {
            button.show()
        } else if firstRowIsVisible() {
            button.hide()
        }
    }
}

extension UICatalogScrollContentIndicatorViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        datasets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(for: indexPath, from: tableView)
        cell.textLabel?.text = datasets[indexPath.row]
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        return cell
    }
}
