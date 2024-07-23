import { UI_COLOR } from "./reduce-colors.js";

export const generateUIColorToolkit = (colors) => {
  const misticaColors = Object.entries(colors).filter(
    (color) => color[1].commonType === UI_COLOR
  );

  return template(misticaColors);
};

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import UIKit

public extension UIColor {
${props
  .map(
    (prop) => `    static var ${prop[0]}: UIColor {
        MisticaConfig.currentColors.${prop[0]}
    }`
  )
  .join("\n")}
}`;
