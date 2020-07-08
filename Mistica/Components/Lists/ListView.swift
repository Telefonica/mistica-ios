//
//  ListView.swift
//
//  Created by Jose Miguel Brocal on 19/05/2020.
//  Copyright © 2020 Jose Miguel Brocal. All rights reserved.
//

import UIKit

public class ListView: UITableView {
	public init() {
		super.init(frame: .zero, style: .plain)

		setUp()
	}

	public override init(frame: CGRect, style: UITableView.Style) {
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

	public override func didMoveToWindow() {
		super.didMoveToWindow()

		// We need to change the separatorStyle here because changing it from the init has no effect ¯\_(ツ)_/¯
		separatorStyle = .none
	}
}
