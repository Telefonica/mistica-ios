import MisticaSwiftUI
import SwiftUI

struct EmptyStateCatalogView: View {
    @State var title: String = "Title"
    @State var description: String = "Description"
    @State var isCard = false

    @State var selectedAssetTypeIndex = 0
    @State var assetTypes: [EmptyStateAssetType] = [
        .image(Image(color: .red)),
        .fullWidth(Image(color: .red)),
        .icon(Image(color: .red), foregroundColor: .black, backgroundColor: .clear)
    ]

    var body: some View {
        List {
            section("Title") { TextField("Title", text: $title) }
            section("Description") { TextField("Description", text: $description) }
            section("Asset type") { assetTypePicker }

            section("Result") {
                EmptyState(
                    assetType: assetTypes[selectedAssetTypeIndex],
                    title: title,
                    description: description,
                    primaryButton: { Button("Primary") {} },
                    secondaryButton: { Button("Secondary") {} }
                )
                .if(isCard) { $0.cardStyle() }
            }
        }
    }

    @ViewBuilder
    var assetTypePicker: some View {
        picker($selectedAssetTypeIndex, options: assetTypes)
            .pickerStyle(SegmentedPickerStyle())
    }
}

// MARK: Helpers

extension EmptyStateAssetType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .fullWidth:
            return "Full Width Image"
        case .image:
            return "Small Image"
        case .icon:
            return "Icon"
        }
    }
}

// MARK: Previews

#if DEBUG
    struct EmptyStateCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                EmptyStateCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
