---
to: Sources/MisticaCommon/Colors/<%= name %>ColorPalette.swift
force: true
---
//
//  <%= name %>ColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//
<%_
colorFromString = function(value) {
  if (value.includes("rgba")) {
    let splitted = value.replace("rgba({","").replace("}, ",",").replace(")","").replace(" ","").split(",")
    let colorName = splitted[0]
    let alphaComponent = splitted[1]
    return name + "Colors." + colorName + ".withAlphaComponent(" + alphaComponent + ")"
  } else {
    let colorName = value.replace("{","").replace("}","")
    return name + "Colors." + colorName
  }
}
-%>

import UIKit

struct <%= name %>Colors: MisticaColors {
	static let palette = <%= name %>ColorPalette()

	<%_ Object.keys(jsonData.light).forEach(function(key) { -%>
		<%_ let lightColorString = jsonData.light[key].value -%>
		<%_ let darkColorString = jsonData.dark[key].value -%>
		<%_ var lightColor = colorFromString(lightColorString) -%>
		<%_ var darkColor = colorFromString(darkColorString) -%>
		<%_ if (!!lightColor & !!darkColor) { -%>
			<%_ if (lightColor == darkColor) { -%>
	let <%= key %> = <%= lightColor %>
			<%_ } else { -%>
	let <%= key %> = <%= lightColor %> | <%= darkColor %>
			<%_ } -%>
		<%_ } -%>
	<%_ }); -%>
}

public struct <%= name %>ColorPalette {
	public init() {}
	<%_ Object.keys(jsonData.global.palette).forEach(function(key) { -%>
	public let <%= key %> = UIColor(hex:"<%= jsonData.global.palette[key].value %>")!
	<%_ }); -%>
}