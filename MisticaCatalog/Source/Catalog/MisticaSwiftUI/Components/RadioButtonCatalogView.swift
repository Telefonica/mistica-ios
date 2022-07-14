import Foundation
import MisticaSwiftUI
import SwiftUI

struct RadioButtonCatalogView: View {
    @State var unselected = false
    @State var selected = true

    var body: some View {
        List {
            section("Selected") { RadioButton(isSelected: $selected) }
            section("Unselected") { RadioButton(isSelected: $unselected) }
        }
    }
}

#if DEBUG
    struct RadioButtonCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                RadioButtonCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
