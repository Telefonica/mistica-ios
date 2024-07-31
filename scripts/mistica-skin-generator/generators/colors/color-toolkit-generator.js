import {UI_COLOR} from './reduce-colors';

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import SwiftUI

public extension Color {
${props
    .map(
        ([color]) => `    static var ${color}: Color {
        MisticaConfig.currentColors.${color}.color
    }`
    )
    .join('\n')}
}

private extension UIColor {
    var color: Color {
        Color(self)
    }
}`;

/**
 *
 * @param {{[id: string]: {commonType: string; darkType: {[brandId: string]: string}; darkValue: {[brandId: string]: any}; lightType: {[brandId: string]: string}; lightValue: {[brandId: string]: any}}}} colors
 * @returns string
 */
export const generateColorToolkit = (colors) => {
    const misticaColors = Object.entries(colors).filter(([, color]) => color.commonType === UI_COLOR);

    return template(misticaColors);
};
