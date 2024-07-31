import {MISTICA_COLOR, UI_COLOR} from './reduce-colors.js';

const mapSolidColor = (prefix, value) => {
    if (value.includes('rgb')) {
        return value.replace(
            /rgba\(\{([a-zA-Z0-9.]+)\},\s*([0-9.]+)\)/,
            `${prefix}Colors.$1.withAlphaComponent($2)`
        );
    } else {
        return `${prefix}Colors.${value.replace(/{|}/g, '')}`;
    }
};

const mapSolidColors = (prefix, lightValue, darkValue) => {
    const lightColor = mapSolidColor(prefix, lightValue);
    const darkColor = mapSolidColor(prefix, darkValue);
    if (lightColor !== darkColor) {
        return `${mapSolidColor(prefix, lightValue)} | ${mapSolidColor(prefix, darkValue)}`;
    } else {
        return mapSolidColor(prefix, lightValue);
    }
};

const mapStops = (colors) => colors.map((color) => color.stop);

const mapGradientColor = (prefix, lightType, lightValue, darkType, darkValue) => {
    const angle = lightValue.angle || darkValue.angle;
    const stops = mapStops(lightValue.colors) || mapStops(lightValue.colorsdarkValue.colors);
    const colors = [];
    const colorsLength = Math.max(lightValue.colors?.length || 0, darkValue.colors?.length || 0);
    for (let colorIndex = 0; colorIndex < colorsLength; colorIndex++) {
        const lightColor = lightType === UI_COLOR ? lightValue : lightValue.colors[colorIndex].value;
        const darkColor = darkType === UI_COLOR ? darkValue : darkValue.colors[colorIndex].value;
        colors.push(mapSolidColors(prefix, lightColor, darkColor));
    }
    return `MisticaColor.gradient(MisticaGradient(
        colors:
        [
${colors.map((color) => `            ${color}`).join(',\n')}
        ],
        stops: ${JSON.stringify(stops)},
        angle: ${angle}
    ))`;
};

const mapColor = (prefix, tokenProp) => {
    switch (tokenProp.commonType) {
        case MISTICA_COLOR:
            if (tokenProp.lightType === UI_COLOR && tokenProp.darkType === UI_COLOR) {
                return `MisticaColor.solid(${mapSolidColors(
                    prefix,
                    tokenProp.lightValue,
                    tokenProp.darkValue
                )})`;
            } else {
                return mapGradientColor(
                    prefix,
                    tokenProp.lightType,
                    tokenProp.lightValue,
                    tokenProp.darkType,
                    tokenProp.darkValue
                );
            }
        case UI_COLOR:
            return mapSolidColors(prefix, tokenProp.lightValue, tokenProp.darkValue);
        default:
            throw `Unexpected type: ${tokenProp.commonType}`;
    }
};

const template = (prefix, paletteProps, tokenProps) => `
// Generated using Make
// DO NOT EDIT

import UIKit

struct ${prefix}Colors: MisticaColors {
    static let palette = ${prefix}ColorPalette()

${tokenProps.map((tokenProp) => `     let ${tokenProp.name} = ${mapColor(prefix, tokenProp)}`).join('\n\n')}
}

public struct ${prefix}ColorPalette {
    public init() {}
${paletteProps
    .map((paletteProp) => `    public let ${paletteProp.name} = UIColor(hex: "${paletteProp.hex}")!`)
    .join('\n')}
}`;

/**
 *
 * @param {{id: string; prefix: string}} brand
 * @param {{[id: string]: {commonType: string; darkType: {[brandId: string]: string}; darkValue: {[brandId: string]: any}; lightType: {[brandId: string]: string}; lightValue: {[brandId: string]: any}}}} colors
 * @param {{[id: string]: {value: string; type: string}}} palette
 * @returns string
 */
export const generateBrandColors = (brand, colors, palette) => {
    const paletteProps = Object.entries(palette)
        .filter(([name, color]) => {
            if (color.type === 'color') {
                return true;
            } else {
                throw `Unknown color type ${name} in ${brand.id} palette`;
            }
        })
        .map(([name, hex]) => ({
            name,
            hex: hex.value,
        }));

    const tokenProps = Object.entries(colors).map(([colorId, color]) => ({
        name: colorId,
        darkValue: color.darkValue[brand.id],
        lightValue: color.lightValue[brand.id],
        darkType: color.darkType[brand.id],
        lightType: color.lightType[brand.id],
        commonType: color.commonType,
    }));

    return template(brand.prefix, paletteProps, tokenProps);
};
