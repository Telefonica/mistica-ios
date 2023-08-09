---
to: Sources/MisticaCommon/Fonts/MisticaFontSizes.swift
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

public protocol MisticaFontSizes {
<%_ Object.keys(jsonObject.jsonData.text.size).forEach(function(key) { -%>
  <%# We use the helper object to use some additional functions to fit the pattern we need. -%>
  var <%= key %>: CGFloat { get }
<%_ }); -%>
}
