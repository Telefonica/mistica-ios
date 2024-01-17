---
to: Sources/MisticaCommon/Colors/ColorToolkit+Color.swift
force: true
---
<%#
to: The path where the file will be create
force: If the file can be overwritten or not
-%>

<%_
let jsonObject = h.params(json)
-%>

// Generated using Make
// DO NOT EDIT

import SwiftUI

public extension Color {
<% Object.keys(jsonObject.jsonData.light).forEach(function(key) { -%>

    static var <%= key %>: Color {
        MisticaConfig.currentColors.<%= key %>.color
    }
<% }); -%>
}

private extension UIColor {
    var color: Color {
        Color(self)
    }
}
