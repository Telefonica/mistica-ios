//
//  CatalogHeader.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import SwiftUI

struct CatalogHeader: View {
    var body: some View {
        HStack {
            Image("mistica-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 32)

            Spacer()

            Text("v2.2.0")
                .foregroundColor(Color(UIColor.textPrimary))
        }
        .padding(.top, 8)
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

struct CatalogHeader_Previews: PreviewProvider {
    static var previews: some View {
        CatalogHeader()
    }
}
