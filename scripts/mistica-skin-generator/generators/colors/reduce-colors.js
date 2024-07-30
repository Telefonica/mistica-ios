export const MISTICA_COLOR = "MisticaColor";
export const UI_COLOR = "UIColor";
export const GRADIENT_COLOR = "MisticaGradient";

/**
 *
 * @param {[{brand: {id: string}; tokens: {light: {[id: string]: {type: string; value: any}}; dark: {[id: string]: {type: string; value: any}}}]} brandsWithTokens
 * @returns {{[id: string]: {commonType: string; darkType: {[brandId: string]: string}; darkValue: {[brandId: string]: any}; lightType: {[brandId: string]: string}; lightValue: {[brandId: string]: any}}}}
 */

export const reduceColors = (brandsWithTokens) =>
  brandsWithTokens.reduce((acc, brandWithTokens) => {
    const brandId = brandWithTokens.brand.id;
    const light = brandWithTokens.tokens.light;
    Object.entries(light).forEach(([colorToken, color]) => {
      const type = mapType(color.type);
      if (type !== undefined) {
        const value = color.value;
        acc[colorToken] = {
          ...acc[colorToken],
          commonType: getCommonType(acc[colorToken]?.commonType, type),
          lightValue: { ...acc[colorToken]?.lightValue, [brandId]: value },
          lightType: { ...acc[colorToken]?.lightType, [brandId]: type },
        };
      } else {
        throw `Unknown type for ${colorToken} ${color}`;
      }
    });

    const dark = brandWithTokens.tokens.dark;
    Object.entries(dark).forEach(([colorToken, color]) => {
      const type = mapType(color.type);
      if (type !== undefined) {
        const value = color.value;
        acc[colorToken] = {
          ...acc[colorToken],
          commonType: getCommonType(acc[colorToken]?.commonType, type),
          darkValue: { ...acc[colorToken]?.darkValue, [brandId]: value },
          darkType: { ...acc[colorToken]?.darkType, [brandId]: type },
        };
      }
    });

    return acc;
  }, {});

const mapType = (type) => {
  switch (type) {
    case "color":
      return UI_COLOR;
    case "linear-gradient":
      return GRADIENT_COLOR;
    default:
      throw `Unknown token type ${type}`;
  }
};

const getCommonType = (previous, current) => {
  if (previous !== undefined && previous !== current) return MISTICA_COLOR;
  if (current === GRADIENT_COLOR) return MISTICA_COLOR;
  else return current;
};
