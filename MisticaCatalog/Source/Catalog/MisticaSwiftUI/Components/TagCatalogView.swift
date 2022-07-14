import MisticaSwiftUI
import SwiftUI

struct TagCatalogView: View {
    @State var tagText: String = "PROMOCIÓN"

    @State var selectedStyleIndex = 0
    @State var styles: [Tag.Style] = Tag.Style.allCases

    var body: some View {
        List {
            section("Title") { TextField("Title", text: $tagText) }
            section("Style") { stylePicker }

            section("Result") {
                Tag(style: styles[selectedStyleIndex], text: tagText)
            }
        }
    }

    @ViewBuilder
    var stylePicker: some View {
        picker($selectedStyleIndex, options: styles)
    }
}

extension Tag.Style: CustomStringConvertible {
    public var description: String {
        switch self {
        case .promo:
            return "Promo"
        case .warning:
            return "Warning"
        case .error:
            return "Error"
        case .success:
            return "Success"
        case .active:
            return "Active"
        case .inactive:
            return "Inactive"
        }
    }
}

#if DEBUG
    struct TagCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                TagCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
