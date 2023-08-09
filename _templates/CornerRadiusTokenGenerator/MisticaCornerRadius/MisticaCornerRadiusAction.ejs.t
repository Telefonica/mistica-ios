---
to: Sources/MisticaCommon/Radius/MisticaCornerRadius.swift
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

import Foundation

public enum MisticaRadiusConstants {
    static let roundedRadius: CGFloat = 999.0
}

public protocol MisticaCornerRadius {
<%_ Object.keys(jsonObject.jsonData.radius).forEach(function(key) { -%>
  var <%= key %>: CGFloat { get }
<%_ }); -%>
}
