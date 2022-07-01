import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension Animation {
    static var misticaTimingCurve: Animation {
        .timingCurve(0.77, 0, 0.175, 1)
    }
}

@available(iOS 13.0.0, *)
public struct Button: View {
    
    public init() {
        
    }
    
    public var body: some View {
        Text("Hola")
    }
}
