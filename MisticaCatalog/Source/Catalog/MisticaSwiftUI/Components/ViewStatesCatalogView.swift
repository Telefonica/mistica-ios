//
//  ViewStatesCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

struct ViewStatesCatalogView: View {
    private let viewStateTypes: [ViewStateType] = [.loadError]
    @State var selectedTypeIndex = 0
    @State private var titleText: String = "Oops, something went wrong"
    @State private var descriptionText: String = "There was an error loading the content, please, check your network connection and try again later."
    @State private var actionButtonTitle: String = "Retry"
    @State private var showActionButton: Bool = true
    @State private var showState: Bool = false

    var body: some View {
        ZStack {
            if !showState {
                List {
                    section("View State Type") {
                        viewStateTypePicker
                    }

                    section("Title (Optional)") {
                        TextField("Title (Optional)", text: $titleText)
                    }

                    section("Description") {
                        TextField("Description", text: $descriptionText)
                    }

                    section("Action Button") {
                        TextField("Action Button Title", text: $actionButtonTitle)
                        Toggle("Show Action Button", isOn: $showActionButton)
                    }

                    Button("Show State") {
                        showState = true
                    }
                    .buttonStyle(.misticaPrimary())
                }
            } else {
                LoadErrorView(
                    titleText: titleText.isEmpty ? nil : titleText,
                    descriptionText: descriptionText.isEmpty ? "Description text is mandatory" : descriptionText,
                    showActionButton: showActionButton,
                    actionButtonTitle: actionButtonTitle,
                    onRetry: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showState = false
                        }
                    },
                    onAppear: {
                        if !showActionButton {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                showState = false
                            }
                        }
                    }
                )
            }
        }
        .navigationBarTitle("View States")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    var viewStateTypePicker: some View {
        picker($selectedTypeIndex, options: viewStateTypes)
    }
}

enum ViewStateType {
    case loadError
}

extension ViewStateType: Swift.CustomStringConvertible {
    public var description: String {
        switch self {
        case .loadError:
            return "Load error"
        }
    }
}

#if DEBUG
    struct UICatalogViewStatesView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ViewStatesCatalogView()
            }
        }
    }
#endif
