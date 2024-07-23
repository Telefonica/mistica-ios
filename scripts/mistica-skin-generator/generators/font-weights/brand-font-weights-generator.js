export const generateBrandFontWeights = (brand, tokens) => {
  const weights = Object.entries(tokens["text"]["weight"]);
  return template(brand.prefix, weights);
};

const template = (prefix, weights) => `
// Generated using Make
// DO NOT EDIT

import Foundation

struct ${prefix}FontWeights: MisticaFontWeights {
${weights
  .map(
    (weight) =>
      `    public var ${weight[0]}: MisticaFontWeightType = .${weight[1].value}`
  )
  .join("\n")}
}
`;
