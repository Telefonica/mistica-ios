//
//  SheetViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class SheetViewController: UIViewController {
    private let sheetView: SheetView
    private let configuration: SheetConfiguration
	public let completionHandler: ((SheetSelectionResponse) -> Void)?

    public init(configuration: SheetConfiguration,
				completionHandler: ((SheetSelectionResponse) -> Void)?) {
        self.configuration = configuration
        self.completionHandler = completionHandler
        sheetView = SheetView(configuration: configuration)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        view = sheetView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        sheetView.dismissSheet = { [weak self] in
            self?.dismiss(animated: true)
        }
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed {
			completionHandler?(sheetView.sheetSelectionResponse)
        }
    }
}
