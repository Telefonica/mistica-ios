---
to: Sources/MisticaCommon/Colors/MisticaColors.swift
force: true
---
import UIKit

public protocol MisticaColors {
<% Object.keys(jsonData.light).forEach(function(key) { -%>
  var <%= key %>: UIColor { get }
<% }); -%>
}