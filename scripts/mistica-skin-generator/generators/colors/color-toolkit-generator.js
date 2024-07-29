import { UI_COLOR } from "./reduce-colors.js";

export const generateColorToolkit = (colors) => {
  const misticaColors = Object.entries(colors).filter(
    ([_, color]) => color.commonType === UI_COLOR
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
    ([color]) => `    static var ${color}: Color {
        MisticaConfig.currentColors.${color}.color
    }`
  )
  .join("\n")}
}

private extension UIColor {
    var color: Color {
        Color(self)
    }
}`;
