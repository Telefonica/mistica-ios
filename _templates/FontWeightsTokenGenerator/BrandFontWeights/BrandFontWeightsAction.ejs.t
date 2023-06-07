---
to: Sources/MisticaCommon/Fonts/Brands/<%= h.inflection.camelize(h.replaceDashes(name)) %>FontWeights.swift
force: true
---
<%# 
to: The path where the file will be create
force: If the file can be overwritten or not
-%>

<%# We need to capitalize the brand name we receive. To do this we used the helper object provided by hygen. -%>
<%_
let className = h.inflection.camelize(h.replaceDashes(name))
let jsonObject = h.params(json)
-%>

import Foundation

struct <%= className %>FontWeights: MisticaFontWeights {
  <%_ Object.keys(jsonObject.jsonData.text.weight).forEach(function(key) { -%>
    <%_ let value = jsonObject.jsonData.text.weight[key].value -%>
    public var <%= key %>: MisticaFontWeightType = .<%= value %>
  <%_ }); -%>
}
