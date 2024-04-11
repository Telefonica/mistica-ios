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
    <%_ if (jsonObject.jsonData.light[key].type === "color") { -%>
        static var <%= key %>: Color {
            MisticaConfig.currentColors.<%= key %>.color
        }
    <%_ } -%>
<% }); -%>
}

private extension UIColor {
    var color: Color {
        Color(self)
    }
}
