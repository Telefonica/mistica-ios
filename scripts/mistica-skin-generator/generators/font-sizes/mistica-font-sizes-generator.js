const template = (props) => `
// Generated using Make
// DO NOT EDIT

import Foundation

public protocol MisticaFontSizes {
${props.map((prop) => `    var ${prop}: CGFloat { get }`).join('\n')}
}
`;

/**
 *
 * @param {{text: {size: {[id: string]: any}}}} anyBrandTokens
 * @returns string
 */
export const generateMisticaFontSizes = (anyBrandTokens) => {
    const weights = Object.keys(anyBrandTokens.text.size);
    return template(weights);
};
