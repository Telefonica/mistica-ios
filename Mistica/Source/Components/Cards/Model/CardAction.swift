//
//  File.swift
//  
//
//  Created by Jose Miguel Brocal on 15/1/21.
//

import Foundation

public struct CardAction {
    public let title: String
    public let loadingTitle: String?
    public let tapHandler: (() -> Void)?

    public init(title: String,
                loadingTitle: String?,
                tapHandler: (() -> Void)?) {
        self.title = title
        self.loadingTitle = loadingTitle
        self.tapHandler = tapHandler
    }
}
