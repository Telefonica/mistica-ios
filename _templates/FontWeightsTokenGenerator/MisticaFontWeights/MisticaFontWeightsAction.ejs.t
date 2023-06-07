---
to: Sources/MisticaCommon/Fonts/MisticaFontWeights.swift
force: true
---
<%# 
to: The path where the file will be create
force: If the file can be overwritten or not
-%>

<%_ 
let jsonObject = h.params(json)
-%>

import UIKit

public protocol MisticaFontWeights {
<%_ Object.keys(jsonObject.jsonData.text.weight).forEach(function(key) { -%>
  <%# We use the helper object to use some additional functions to fit the pattern we need. -%>
  var <%= key %>: MisticaFontWeightType { get }
<%_ }); -%>
}
