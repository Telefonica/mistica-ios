export const generateBrandCornerRadius = (brand, tokens) => {
  const cornerRadius = Object.entries(tokens["radius"]);
  return template(brand.prefix, cornerRadius);
};

const mapValue = (value) =>
  value === "circle" || value === "999"
    ? "MisticaRadiusConstants.roundedRadius"
    : value;

const template = (prefix, cornerRadius) => `
// Generated using Make
// DO NOT EDIT

import Foundation

struct ${prefix}CornerRadius: MisticaCornerRadius {
${cornerRadius
  .map(
    (radius) => `    var ${radius[0]}: CGFloat = ${mapValue(radius[1].value)}`
  )
  .join("\n")}
}
`;
