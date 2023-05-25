---
to: Sources/MisticaCommon/Colors/<%= h.inflection.capitalize(name) %>ColorPalette.swift
force: true
---
<%_
let className = h.inflection.capitalize(name)
-%>

import UIKit

struct <%= className %>Colors: MisticaColors {
	static let palette = <%= className %>ColorPalette()

	<%_ Object.keys(jsonData.light).forEach(function(key) { -%>
		<%_ let lightColorString = jsonData.light[key].value -%>
		<%_ let darkColorString = jsonData.dark[key].value -%>
		<%_ var lightColor = h.colorFromString(lightColorString, className) -%>
		<%_ var darkColor = h.colorFromString(darkColorString, className) -%>
		<%_ if (!!lightColor & !!darkColor) { -%>
			<%_ if (lightColor == darkColor) { -%>
	let <%= key %> = <%= lightColor %>
			<%_ } else { -%>
	let <%= key %> = <%= lightColor %> | <%= darkColor %>
			<%_ } -%>
		<%_ } -%>
	<%_ }); -%>
}

public struct <%= className %>ColorPalette {
	public init() {}
	<%_ Object.keys(jsonData.global.palette).forEach(function(key) { -%>
	public let <%= key %> = UIColor(hex:"<%= jsonData.global.palette[key].value %>")!
	<%_ }); -%>
}