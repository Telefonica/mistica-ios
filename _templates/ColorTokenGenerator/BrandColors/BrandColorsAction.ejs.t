---
to: Sources/MisticaCommon/Colors/<%= h.inflection.camelize(h.replaceDashes(name)) %>ColorPalette.swift
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

import UIKit

struct <%= className %>Colors: MisticaColors {
	static let palette = <%= className %>ColorPalette()

	<%_ Object.keys(jsonObject.jsonData.light).forEach(function(key) { -%>
	    <%_ if (jsonObject.jsonData.light[key].type === "color") { -%>
			<%_ let lightColorString = jsonObject.jsonData.light[key].value -%>
			<%_ let darkColorString = jsonObject.jsonData.dark[key].value -%>
			<%_ var lightColor = h.colorFromString(lightColorString, className) -%>
			<%_ var darkColor = h.colorFromString(darkColorString, className) -%>
			<%_ if (!!lightColor & !!darkColor) { -%>
				<%_ if (lightColor == darkColor) { -%>
		let <%= key %> = <%= lightColor %>
				<%_ } else { -%>
		let <%= key %> = <%= lightColor %> | <%= darkColor %>
				<%_ } -%>
			<%_ } -%>
		<%_ } -%>	
	<%_ }); -%>
}

public struct <%= className %>ColorPalette {
    public init() {}
    <%_ Object.keys(jsonObject.jsonData.global.palette).forEach(function(key) { -%>
        <%_ if (jsonObject.jsonData.global.palette[key].type === "color") { -%>
    public let <%= key %> = UIColor(hex:"<%= jsonObject.jsonData.global.palette[key].value %>")!
        <%_ } -%>
    <%_ }); -%>
}
