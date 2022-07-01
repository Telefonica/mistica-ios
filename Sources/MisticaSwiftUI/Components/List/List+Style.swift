import SwiftUI
import Shared

@available(iOS 13.0, *)
public extension List {
    func misticaListStyle() -> some View {
        modifier(MisticaListStyle())
    }
}

@available(iOS 13.0, *)
private struct MisticaListStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listStyle(.plain)
            .background(Color.background)
    }
}

// MARK: Previews

#if DEBUG
    
    @available(iOS 13.0, *)
    struct MisticaList_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                NavigationView {
                    List {
                        Cell(style: .boxed, title: "Title", subtitle: "subtitle")
                        Cell(style: .boxed, title: "Title", subtitle: "subtitle")
                        Cell(style: .fullwidth, title: "Title", subtitle: "subtitle")
                    }
                    .misticaListStyle()
                    .misticaBackport.navigationBarTitle("Lists")
                    .misticaNavigationViewStyle()
                }
            }
        }
    }
#endif
