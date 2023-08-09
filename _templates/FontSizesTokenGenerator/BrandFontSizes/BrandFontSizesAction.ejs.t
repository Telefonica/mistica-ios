---
to: Sources/MisticaCommon/Fonts/Brands/<%= h.inflection.camelize(h.replaceDashes(name)) %>FontSizes.swift
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

// Generated using Make
// DO NOT EDIT

import Foundation

struct <%= className %>FontSizes: MisticaFontSizes {
  <%_ Object.keys(jsonObject.jsonData.text.size).forEach(function(key) { -%>
    <%_ let value = jsonObject.jsonData.text.size[key].value.mobile -%>
    public var <%= key %>: CGFloat = <%= value %>
  <%_ }); -%>
}
