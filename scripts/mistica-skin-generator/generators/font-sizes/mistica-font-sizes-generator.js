export const generateMisticaFontSizes = (anyBrandTokens) => {
  const weights = Object.keys(anyBrandTokens["text"]["size"]);
  return template(weights);
};

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import Foundation

public protocol MisticaFontSizes {
${props.map((prop) => `    var ${prop}: CGFloat { get }`).join("\n")}
}
`;
