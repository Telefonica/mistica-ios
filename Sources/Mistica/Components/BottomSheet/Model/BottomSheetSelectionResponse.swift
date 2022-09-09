//
//  BottomSheetSelectionResponse.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum BottomSheetActionResponse: String {
    case dismiss = "DISMISS"
    case submit = "SUBMIT"
}

public class BottomSheetSelectionResponse {
    public var action: BottomSheetActionResponse
    public var content: [String: String]

    public init(action: BottomSheetActionResponse = .dismiss,
                content: [String: String] = [:]) {
        self.action = action
        self.content = content
    }
}
