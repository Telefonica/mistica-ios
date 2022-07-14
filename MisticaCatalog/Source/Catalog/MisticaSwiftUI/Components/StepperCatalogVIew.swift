import Foundation
import MisticaSwiftUI
import SwiftUI

struct StepperCatalogView: View {
    @State var step = 0

    var body: some View {
        List {
            section("Configuration") {
                SwiftUI.Stepper("Step", value: $step, in: 0 ... 4)
            }

            section("UndeterminedStepper") {
                UndeterminedStepper(step: $step, steps: 4)
            }

            section("DeterminedStepper") {
                DeterminedStepper(step: $step, steps: 4)
            }
        }
        .listStyle(.insetGrouped)
    }
}

#if DEBUG
    struct StepperCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                StepperCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
