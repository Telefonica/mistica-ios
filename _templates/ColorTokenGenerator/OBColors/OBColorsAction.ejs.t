---
to: Sources/MisticaCommon/Colors/<%= name[0].toUpperCase() + name.substring(1) %>ColorPalette.swift
force: true
---
<%_
let className = name[0].toUpperCase() + name.substring(1)
-%>
<%_
colorFromString = function(value) {
  if (value.includes("rgba")) {
    let splitted = value.replace("rgba({","").replace("}, ",",").replace(")","").replace(" ","").split(",")
    let colorName = splitted[0]
    let alphaComponent = splitted[1]
    return className + "Colors." + colorName + ".withAlphaComponent(" + alphaComponent + ")"
  } else {
    let colorName = value.replace("{","").replace("}","")
    return className + "Colors." + colorName
  }
}
-%>
//
//  <%= className %>ColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct <%= className %>Colors: MisticaColors {
	static let palette = <%= className %>ColorPalette()

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

public struct <%= className %>ColorPalette {
	public init() {}
	<%_ Object.keys(jsonData.global.palette).forEach(function(key) { -%>
	public let <%= key %> = UIColor(hex:"<%= jsonData.global.palette[key].value %>")!
	<%_ }); -%>
}