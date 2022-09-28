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

    override public func viewDidLoad() {
        super.viewDidLoad()

		view.addSubview(withDefaultConstraints: sheetView)

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

// MARK: Custom Accessibilities

public extension SheetViewController {
	var titleAccessibilityIdentifier: String? {
		get {
			sheetView.titleAccessibilityIdentifier
		}
		set {
			sheetView.titleAccessibilityIdentifier = newValue
		}
	}

	var subtitleAccessibilityIdentifier: String? {
		get {
			sheetView.subtitleAccessibilityIdentifier
		}
		set {
			sheetView.subtitleAccessibilityIdentifier = newValue
		}
	}

	var descriptionAccessibilityIdentifier: String? {
		get {
			sheetView.descriptionAccessibilityIdentifier
		}
		set {
			sheetView.descriptionAccessibilityIdentifier = newValue
		}
	}
}
