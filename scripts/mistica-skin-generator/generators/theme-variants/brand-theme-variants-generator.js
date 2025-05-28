const template = (prefix, themeVariants) => `
// Generated using Make
// DO NOT EDIT

import Foundation

struct ${prefix}ThemeVariants: MisticaThemeVariants {
${themeVariants.map(([name, themeVariant]) => `    var ${name}: MisticaThemeVariantType = .${themeVariant.value}`).join('\n')}
}
`;

/**
 *
 * @param {{prefix: string}} brand
 * @param {{text: {themeVariant: {[id: string]: {value: any}}}}} tokens
 * @returns string
 */
export const generateBrandThemeVariants = (brand, tokens) => {
    const themeVariants = Object.entries(tokens.themeVariant);
    return template(brand.prefix, themeVariants);
};
