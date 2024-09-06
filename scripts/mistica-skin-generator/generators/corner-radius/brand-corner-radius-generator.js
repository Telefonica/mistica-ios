const mapValue = (value) =>
    value === 'circle' || value === '999' ? 'MisticaRadiusConstants.roundedRadius' : value;

const template = (prefix, cornerRadius) => `
// Generated using Make
// DO NOT EDIT

import Foundation

struct ${prefix}CornerRadius: MisticaCornerRadius {
${cornerRadius.map(([name, radius]) => `    var ${name}: CGFloat = ${mapValue(radius.value)}`).join('\n')}
}
`;

/**
 *
 * @param {{prefix: string}} brand
 * @param {{text: {radius: {[id: string]: {value: any}}}}} tokens
 * @returns string
 */
export const generateBrandCornerRadius = (brand, tokens) => {
    const cornerRadius = Object.entries(tokens.radius);
    return template(brand.prefix, cornerRadius);
};
