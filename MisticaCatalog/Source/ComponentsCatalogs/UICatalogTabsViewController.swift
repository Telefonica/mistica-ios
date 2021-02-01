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
        styleViews()
    }
}

private extension UICatalogTabsViewController {
    func setUp() {
        
    }
    
    func styleViews() {
        
    }
}
