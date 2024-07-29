export const generateBrandFontSizes = (brand, tokens) => {
  const sizes = Object.entries(tokens.text.size);
  return template(brand.prefix, sizes);
};

const template = (prefix, sizes) => `
// Generated using Make
// DO NOT EDIT

import Foundation

struct ${prefix}FontSizes: MisticaFontSizes {
${sizes
  .map(
    ([name, size]) => `    public var ${name}: CGFloat = ${size.value.mobile}`
  )
  .join("\n")}
}
`;
