import {UI_COLOR} from './reduce-colors.js';

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import UIKit

public extension UIColor {
${props
    .map(
        ([name]) => `    static var ${name}: UIColor {
        MisticaConfig.currentColors.${name}
    }`
    )
    .join('\n')}
}`;

/**
 *
 * @param {{[id: string]: {commonType: string; darkType: {[brandId: string]: string}; darkValue: {[brandId: string]: any}; lightType: {[brandId: string]: string}; lightValue: {[brandId: string]: any}}}} colors
 * @returns string
 */
export const generateUIColorToolkit = (colors) => {
    const misticaColors = Object.entries(colors).filter(([, color]) => color.commonType === UI_COLOR);

    return template(misticaColors);
};
