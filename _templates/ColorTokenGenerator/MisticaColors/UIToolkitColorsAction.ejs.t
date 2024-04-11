---
to: Sources/MisticaCommon/Colors/ColorToolkit+UIColor.swift
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

import UIKit

public extension UIColor {
<% Object.keys(jsonObject.jsonData.light).forEach(function(key) { -%>
    <%_ if (jsonObject.jsonData.light[key].type === "color") { -%>
        @objc(<%= key %>Color)
        static var <%= key %>: UIColor {
            MisticaConfig.currentColors.<%= key %>
        }
    <%_ } -%>
<% }); -%>
}

public extension BrandStyle {
    var preferredStatusBarStyle: UIStatusBarStyle {
        switch self {
        case .movistar, .vivo, .o2, .o2New, .blau, .custom, .vivoNew, .telefonica:
            return .lightContent
        }
    }
}
