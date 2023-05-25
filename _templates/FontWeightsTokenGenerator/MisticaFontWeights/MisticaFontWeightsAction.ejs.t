---
to: Sources/MisticaCommon/Fonts/MisticaFontWeights.swift
force: true
---
import UIKit

public protocol MisticaFontWeights {
<%_ Object.keys(jsonData.text.weight).forEach(function(key) { -%>
  var text<%= h.inflection.capitalize(key.replace('-','')) %>: MisticaFontWeightType { get }
<%_ }); -%>
}