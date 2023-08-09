---
to: Sources/MisticaCommon/Colors/MisticaColors.swift
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

public protocol MisticaColors {
<% Object.keys(jsonObject.jsonData.light).forEach(function(key) { -%>
  var <%= key %>: UIColor { get }
<% }); -%>
}
