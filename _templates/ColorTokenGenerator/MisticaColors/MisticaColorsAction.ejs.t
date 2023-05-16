---
to: Sources/MisticaCommon/Colors/MisticaColors.swift
force: true
---
//
//  MisticaColors.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public protocol MisticaColors {
<% Object.keys(jsonData.light).forEach(function(key) { %>
  var <%= key %>: UIColor { get }
<% }); %>
}