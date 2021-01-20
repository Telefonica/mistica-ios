//
//  ContentView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                CatalogHeader()
                CatalogList()
            }
            .navigationBarHidden(true)
            .misticaNavigationBarStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
