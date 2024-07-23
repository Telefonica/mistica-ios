export const MISTICA_COLOR = "MisticaColor";
export const UI_COLOR = "UIColor";
export const GRADIENT_COLOR = "MisticaGradient";

export const reduceColors = (brandsWithTokens) =>
  brandsWithTokens.reduce((acc, brandWithTokens) => {
    const brandId = brandWithTokens.brand.id;
    const light = brandWithTokens.tokens.light;
    Object.entries(light).forEach((entry) => {
      const colorToken = entry[0];
      const type = mapType(entry[1]["type"]);
      if (type !== undefined) {
        const value = entry[1]["value"];
        acc[colorToken] = {
          ...acc[colorToken],
          commonType: getCommonType(acc[colorToken]?.commonType, type),
          lightValue: { ...acc[colorToken]?.lightValue, [brandId]: value },
          lightType: { ...acc[colorToken]?.lightType, [brandId]: type },
        };
      } else {
        console.error(`Unknown type for ${entry[0]} ${entry[1]}`);
      }
    });

    const dark = brandWithTokens.tokens.dark;
    Object.entries(dark).forEach((entry) => {
      const colorToken = entry[0];
      const type = mapType(entry[1]["type"]);
      if (type !== undefined) {
        const value = entry[1]["value"];
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
      console.warn(`Unknown token type ${type}`);
      return undefined;
  }
};

const getCommonType = (previous, current) => {
  if (previous !== undefined && previous !== current) return MISTICA_COLOR;
  if (current === GRADIENT_COLOR) return MISTICA_COLOR;
  else return current;
};
