//
//  Header.swift
//  
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public struct Header: View {
    private let pretitle: String?
    private let title: String?
    private let description: String?
    
    
    
    public init(
        pretitle: String? = nil,
        title: String? = nil,
        description: String? = nil
    ) {
        self.pretitle = pretitle
        self.title = title
        self.description = description
    }
    
    public var body: some View {
        VStack() {
            if let pretitle = pretitle {
                Text(pretitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                    .background(Color.red)
            }
            if let title = title {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                    .background(Color.orange)
            }
            if let description = description {
                Text(description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                    .background(Color.green)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .background(Color.yellow)
    }
}

// MARK: Previews

#if DEBUG
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Preview {
            Header(
                pretitle: "The pretitle",
                title: "The title",
                description: "The description value, con un valor muy largo que ocupa muchas lineas..."
            )
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif
