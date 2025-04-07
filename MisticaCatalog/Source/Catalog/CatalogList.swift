//
//  CatalogList.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

struct CatalogList: View {
    @State var selectedFrameworkIndex = 0
    let rows: [CatalogRow]

    var body: some View {
        List {
            ForEach(rows) { row in
                Cell(
                    style: .fullwidth,
                    title: row.title,
                    subtitle: nil,
                    description: nil,
                    assetType: .smallIcon(
                        Image(uiImage: row.icon),
                        foregroundColor: nil
                    ),
                    presetView: { CellNavigationPreset() },
                    headlineView: {},
                    destinationView: {
                        componentView(for: row)
                            .navigationTitle(row.title)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                )
                .shouldShowDivider(row != rows.last)
            }
        }
        .misticaListStyle()
    }

    @ViewBuilder
    func componentView(for row: CatalogRow) -> some View {
        VStack(spacing: 0) {
            Tabs(
                Framework.allCases.map { TabItem(text: $0.name) },
                selection: $selectedFrameworkIndex
            )

            switch Framework.allCases[selectedFrameworkIndex] {
            case .swiftUI:
                row.swiftUIComponent.expandVertically()
            case .uiKit:
                row.uiKitComponent.expandVertically()
            }
        }
    }
}

private extension CatalogRow {
    @ViewBuilder
    var swiftUIComponent: some View {
        switch self {
        case .badge:
            BadgeCatalogView()
        case .buttons:
            ButtonsCatalogView()
        case .skeletons:
            SkeletonsCatalogView()
        case .cards:
            CardList(rows: CardRow.allCases)
        case .snackbar:
            SnackbarCatalogView()
        case .feedbacks:
            FeedbackCatalogView()
        case .inputFields:
            InputFieldCatalogView()
        case .stepper:
            StepperCatalogView()
        case .tabs:
            TabsCatalogView()
        case .tag:
            TagCatalogView()
        case .callout:
            CalloutCatalogView()
        case .emptyState:
            EmptyStateCatalogView()
        case .lists:
            ListCatalogView()
        case .carousel:
            CarouselCatalogView()
        case .chips:
            ChipCatalogView()
        case .header:
            HeaderCatalogView()
        case .forms:
            FormViewCatalog()
        case .viewStates:
            ViewStatesCatalogView()
        case .tooltip,
             .title,
             .filter,
             .scrollContentIndicator,
             .controls,
             .sheet,
             .textLink:
            notImplementedView
        }
    }

    @ViewBuilder
    var uiKitComponent: some View {
        switch self {
        case .buttons:
            ComponentViewController(UICatalogButtonsViewController())
        case .feedbacks:
            ComponentViewController(UICatalogFeedbacksViewController())
        case .snackbar:
            ComponentViewController(UICatalogSnackbarViewController())
        case .filter:
            ComponentViewController(UICatalogFilterViewController())
        case .tooltip:
            ComponentViewController(UICatalogPopoverViewController())
        case .viewStates:
            ComponentViewController(UICatalogViewStatesViewController())
        case .badge:
            ComponentViewController(UICatalogBadgeViewController())
        case .inputFields:
            ComponentViewController(UICatalogInputFieldsViewController())
        case .forms:
            ComponentViewController(UICatalogFormViewController())
        case .scrollContentIndicator:
            ComponentViewController(UICatalogScrollContentIndicatorViewController())
        case .tag:
            ComponentViewController(UICatalogTagsViewController())
        case .lists:
            ComponentViewController(UICatalogListsViewController())
        case .title:
            ComponentViewController(UICatalogSectionTitleViewController())
        case .header:
            ComponentViewController(UICatalogHeaderViewController())
        case .controls:
            ComponentViewController(UICatalogControlsViewController())
        case .cards:
            ComponentViewController(UICatalogCardsViewController())
        case .stepper:
            ComponentViewController(UICatalogStepperViewController())
        case .tabs:
            ComponentViewController(UICatalogTabsViewController())
        case .callout:
            ComponentViewController(UICatalogCalloutViewController())
        case .emptyState:
            ComponentViewController(UICatalogEmptyStateViewController())
        case .sheet:
            ComponentViewController(UICatalogSheetViewController())
        case .skeletons:
            ComponentViewController(UICatalogSkeletonsViewController())
        case .textLink:
            ComponentViewController(UICatalogTextLinkViewController())
        case .chips,
             .carousel:
            notImplementedView
        }
    }

    @ViewBuilder
    var notImplementedView: some View {
        Text("Not implemented yet")
            .font(.textPreset5())
            .foregroundColor(.textPrimary)
    }
}

struct ComponentViewController: UIViewControllerRepresentable {
    let viewController: UIViewController

    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Do nothing
    }
}

#if DEBUG
    struct CatalogList_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                CatalogList(rows: CatalogRow.allCases)
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
