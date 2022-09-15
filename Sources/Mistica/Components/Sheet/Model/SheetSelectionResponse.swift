//
//  SheetSelectionResponse.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum SheetActionResponse: String {
    case dismiss = "DISMISS"
    case submit = "SUBMIT"
}

public class SheetSelectionResponse {
    public var action: SheetActionResponse
    public var selectedIds: [SheetResponseResult]

    public init(action: SheetActionResponse = .dismiss,
                selectedIds: [SheetResponseResult] = []) {
        self.action = action
        self.selectedIds = selectedIds
    }
}

public struct SheetResponseResult: Encodable, Equatable {
    public let id: String
    public let selected: [String]

    public init(id: String,
                selected: [String]) {
        self.id = id
        self.selected = selected
    }
}
