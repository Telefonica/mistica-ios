export const generateBrandFontSizes = (brand, tokens) => {
  const sizes = Object.entries(tokens["text"]["size"]);
  return template(brand.prefix, sizes);
};

const template = (prefix, sizes) => `
// Generated using Make
// DO NOT EDIT

import Foundation

struct ${prefix}FontSizes: MisticaFontSizes {
${sizes
  .map((size) => `    public var ${size[0]}: CGFloat = ${size[1].value.mobile}`)
  .join("\n")}
}
`;
