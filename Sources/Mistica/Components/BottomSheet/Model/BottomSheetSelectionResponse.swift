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
	let id: String
	let selected: [String]
}
