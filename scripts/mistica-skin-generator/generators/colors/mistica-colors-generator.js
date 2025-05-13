const template = (props) => `
// Generated using Make
// DO NOT EDIT

import UIKit

public protocol MisticaColors: Sendable {
${props.map(([name, color]) => `    var ${name}: ${color.commonType} { get }`).join('\n')}
}
`;

/**
 *
 * @param {{[id: string]: {commonType: string; darkType: {[brandId: string]: string}; darkValue: {[brandId: string]: any}; lightType: {[brandId: string]: string}; lightValue: {[brandId: string]: any}}}} colors
 * @returns string
 */
export const generateMisticaColors = (colors) => template(Object.entries(colors));
