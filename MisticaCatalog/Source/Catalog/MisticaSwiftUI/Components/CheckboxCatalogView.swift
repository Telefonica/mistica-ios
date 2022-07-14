import Foundation
import MisticaSwiftUI
import SwiftUI

struct CheckboxCatalogView: View {
    @State var unselected = false
    @State var selected = true

    var body: some View {
        List {
            section("Selected") { Checkbox(isSelected: $selected) }
            section("Unselected") { Checkbox(isSelected: $unselected) }
        }
    }
}

#if DEBUG
    struct CheckboxCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                CheckboxCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
