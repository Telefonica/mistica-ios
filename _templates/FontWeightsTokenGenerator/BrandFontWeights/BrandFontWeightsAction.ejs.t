---
to: Sources/MisticaCommon/Fonts/Brands/<%= h.inflection.capitalize(name) %>FontWeights.swift
force: true
---
<%# We need to capitalize the brand name we receive. To do this we used the helper object provided by hygen. -%>
<%_
let className = h.inflection.capitalize(name)
-%>

import Foundation

struct <%= className %>FontWeights: MisticaFontWeights {
  <%_ Object.keys(jsonData.text.weight).forEach(function(key) { -%>
    <%_ let value = jsonData.text.weight[key].value -%>
    public var text<%= h.inflection.capitalize(key.replace('-','')) %>: MisticaFontWeightType = .<%= value %>
  <%_ }); -%>
}