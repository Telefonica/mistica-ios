//
//  UICatalogTabsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

public class UICatalogTabsViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Tabs"

        setUp()
    }
}

private extension UICatalogTabsViewController {
    func setUp() {
        let tabsView = TabsView(tabsItems: [
            TabItem(title: "Item", icon: "🎲")
            ,TabItem(title: "Item long text", icon: "🎲")
            ,TabItem(title: "Item long text Item long text", icon: "🎲")
        ])

        view.backgroundColor = .white

        view.addSubview(tabsView, constraints: [
            tabsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            tabsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tabsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ])
    }
}
