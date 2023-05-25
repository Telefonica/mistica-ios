---
to: Sources/MisticaCommon/Fonts/MisticaFontWeights.swift
force: true
---
import UIKit

public protocol MisticaFontWeights {
<%_ Object.keys(jsonData.text.weight).forEach(function(key) { -%>
  <%# We use the helper object to use some additional functions to fit the pattern we need. -%>
  var text<%= h.inflection.capitalize(key.replace('-','')) %>: MisticaFontWeightType { get }
<%_ }); -%>
}