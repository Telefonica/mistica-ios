//
//  ListView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class ListView: UITableView {
    public init() {
        super.init(frame: .zero, style: .plain)

        setUp()
    }

    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setUp()
    }

    private func setUp() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = UITableView.automaticDimension
        sectionHeaderHeight = UITableView.automaticDimension
        estimatedSectionHeaderHeight = UITableView.automaticDimension

        backgroundColor = .background
    }

    override public func didMoveToWindow() {
        super.didMoveToWindow()

        // We need to change the separatorStyle here because changing it from the init has no effect ¯\_(ツ)_/¯
        separatorStyle = .none
    }
}
