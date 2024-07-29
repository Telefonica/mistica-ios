import { MISTICA_COLOR } from "./reduce-colors.js";

export const generateMisticaColor = (colors) => {
  const misticaColors = Object.entries(colors).filter(
    ([_, color]) => color.commonType === MISTICA_COLOR
  );

  return template(misticaColors);
};

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import UIKit

public enum MisticaColor {
    case solid(UIColor)
    case gradient(MisticaGradient)
}

public extension MisticaColor {
${props
  .map(
    ([name, color]) => `    static var ${name}: ${color.commonType} {
        MisticaConfig.currentColors.${name}
    }`
  )
  .join("\n")}
}
`;
