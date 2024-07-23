import { MISTICA_COLOR } from "./reduce-colors.js";

export const generateMisticaColor = (colors) => {
  const misticaColors = Object.entries(colors).filter(
    (color) => color[1].commonType === MISTICA_COLOR
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
    (prop) => `    static var ${prop[0]}: ${prop[1].commonType} {
        MisticaConfig.currentColors.${prop[0]}
    }`
  )
  .join("\n")}
}
`;
