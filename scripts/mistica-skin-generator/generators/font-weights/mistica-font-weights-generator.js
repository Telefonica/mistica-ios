const template = (props) => `
// Generated using Make
// DO NOT EDIT

import UIKit

public protocol MisticaFontWeights: Sendable {
${props.map((prop) => `    var ${prop}: MisticaFontWeightType { get }`).join('\n')}
}
`;

/**
 *
 * @param {{text: {weight: {[id: string]: any}}}} anyBrandTokens
 * @returns string
 */
export const generateMisticaFontWeights = (anyBrandTokens) => {
    const weights = Object.keys(anyBrandTokens.text.weight);
    return template(weights);
};
