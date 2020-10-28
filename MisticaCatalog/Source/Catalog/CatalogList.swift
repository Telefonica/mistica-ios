//
//  CatalogList.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import SwiftUI

struct CatalogList: UIViewControllerRepresentable {
    typealias UIViewControllerType = UICatalogViewController

    func makeUIViewController(context: Context) -> UICatalogViewController {
        UICatalogViewController()
    }

    func updateUIViewController(_ uiViewController: UICatalogViewController, context: Context) {
        // do nothing
    }
}
