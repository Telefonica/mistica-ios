//
//  SheetSelectionResponse.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

// - DISMISS: when you tap outside for example but you didn't select any option. You must send anyway the initial selected option as response.
// - SUBMIT when you select an option manually and the sheet is dismissed.
public enum SheetActionResponse: String {
    case dismiss = "DISMISS"
    case submit = "SUBMIT"
}

public class SheetSelectionResponse {
    var action: SheetActionResponse
    var selectedIds: [SheetResponseResult]

    public init(action: SheetActionResponse = .dismiss,
                selectedIds: [SheetResponseResult] = []) {
        self.action = action
        self.selectedIds = selectedIds
    }
}

public struct SheetResponseResult: Encodable, Equatable {
    let id: String
    let selected: [String]

    public init(id: String,
                selected: [String]) {
        self.id = id
        self.selected = selected
    }
}
