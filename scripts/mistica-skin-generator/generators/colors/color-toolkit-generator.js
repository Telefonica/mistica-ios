import { UI_COLOR } from "./reduce-colors.js";

export const generateColorToolkit = (colors) => {
  const misticaColors = Object.entries(colors).filter(
    (color) => color[1].commonType === UI_COLOR
  );

  return template(misticaColors);
};

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import SwiftUI

public extension Color {
${props
  .map(
    (prop) => `    static var ${prop[0]}: Color {
        MisticaConfig.currentColors.${prop[0]}.color
    }`
  )
  .join("\n")}
}

private extension UIColor {
    var color: Color {
        Color(self)
    }
}`;
