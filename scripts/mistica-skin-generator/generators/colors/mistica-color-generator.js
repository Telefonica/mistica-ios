import { MISTICA_COLOR } from "./reduce-colors";

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

/**
 *
 * @param {{[id: string]: {commonType: string; darkType: {[brandId: string]: string}; darkValue: {[brandId: string]: any}; lightType: {[brandId: string]: string}; lightValue: {[brandId: string]: any}}}} colors
 * @returns string
 */
export const generateMisticaColor = (colors) => {
  const misticaColors = Object.entries(colors).filter(
    ([, color]) => color.commonType === MISTICA_COLOR
  );

  return template(misticaColors);
};
