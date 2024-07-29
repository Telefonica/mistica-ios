export const generateMisticaFontWeights = (anyBrandTokens) => {
  const weights = Object.keys(anyBrandTokens.text.weight);
  return template(weights);
};

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import UIKit

public protocol MisticaFontWeights {
${props
  .map((prop) => `    var ${prop}: MisticaFontWeightType { get }`)
  .join("\n")}
}
`;
