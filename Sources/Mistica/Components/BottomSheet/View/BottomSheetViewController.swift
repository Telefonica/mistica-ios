//
//  BottomSheetViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class BottomSheetViewController: UIViewController {
    private let bottomSheetView: BottomSheetView
    private let configuration: BottomSheetConfiguration
    public let completionHandler: ((BottomSheetSelectionResponse) -> Void)?

    public init(configuration: BottomSheetConfiguration,
                completionHandler: @escaping (BottomSheetSelectionResponse) -> Void) {
        self.configuration = configuration
        self.completionHandler = completionHandler
        bottomSheetView = BottomSheetView(configuration: configuration)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        view = bottomSheetView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        bottomSheetView.dismissBottomSheet = { [weak self] in
            self?.dismiss(animated: true)
        }
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed {
            completionHandler?(bottomSheetView.bottomSheetSelectionResponse)
        }
    }
}
