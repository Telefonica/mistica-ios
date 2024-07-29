import { UI_COLOR } from "./reduce-colors.js";

export const generateUIColorToolkit = (colors) => {
  const misticaColors = Object.entries(colors).filter(
    ([_, color]) => color.commonType === UI_COLOR
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
    ([name]) => `    static var ${name}: UIColor {
        MisticaConfig.currentColors.${name}
    }`
  )
  .join("\n")}
}`;
