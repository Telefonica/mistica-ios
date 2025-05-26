const template = (props) => `
// Generated using Make
// DO NOT EDIT

import Foundation

public protocol MisticaThemeVariants {
${props.map((prop) => `    var ${prop}: CGFloat { get }`).join('\n')}
}
`;

/**
 *
 * @param {{text: {themeVariant: {[id: string]: any}}}} anyBrandTokens
 * @returns string
 */

export const generateMisticaThemeVariants = (anyBrandTokens) => {
    const themeVariants = Object.keys(anyBrandTokens.themeVariant);
    return template(themeVariants);
};
