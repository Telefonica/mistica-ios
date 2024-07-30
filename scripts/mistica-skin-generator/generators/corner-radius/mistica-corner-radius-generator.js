/**
 *
 * @param {{text: {radius: {[id: string]: any}}}} anyBrandTokens
 * @returns string
 */

export const generateMisticaCornerRadius = (anyBrandTokens) => {
  const cornerRadius = Object.keys(anyBrandTokens.radius);
  return template(cornerRadius);
};

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import Foundation

public enum MisticaRadiusConstants {
    static let roundedRadius: CGFloat = 999.0
}

public protocol MisticaCornerRadius {
${props.map((prop) => `    var ${prop}: CGFloat { get }`).join("\n")}
}
`;
