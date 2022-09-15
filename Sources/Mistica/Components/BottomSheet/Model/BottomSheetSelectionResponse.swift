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
    public var selectedIds: [SheetResponseResult]

    public init(action: BottomSheetActionResponse = .dismiss,
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
