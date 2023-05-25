---
to: Sources/MisticaCommon/Radius/Brands/<%= h.inflection.capitalize(name) %>CornerRadius.swift
force: true
---
<%# 
to: The path where the file will be create
force: If the file can be overwritten or not
-%>

<%# We need to capitalize the brand name we receive. To do this we used the helper object provided by hygen. -%>
<%_
let className = h.inflection.capitalize(name)
-%>

import Foundation

struct <%= className %>CornerRadius: MisticaCornerRadius {
	<%_ Object.keys(jsonData.radius).forEach(function(key) { -%>
		<%_ let value = jsonData.radius[key].value -%>
		<%_ if (value == "circle" || value == "999") { -%>
	var <%= key %>: CGFloat = MisticaRadiusConstants.roundedRadius
		<%_ } else { -%>
	var <%= key %>: CGFloat = <%= value %>
		<%_ } -%>
	<%_ }); -%>
}