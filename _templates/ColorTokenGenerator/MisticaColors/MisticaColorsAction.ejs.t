---
to: Sources/MisticaCommon/Colors/MisticaColors.swift
force: true
---
<%# 
to: The path where the file will be create
force: If the file can be overwritten or not
-%>

import UIKit

public protocol MisticaColors {
<% Object.keys(jsonData.light).forEach(function(key) { -%>
  var <%= key %>: UIColor { get }
<% }); -%>
}