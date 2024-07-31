import fs from "fs";
import { generateMisticaCornerRadius } from "./generators/corner-radius/mistica-corner-radius-generator";
import { generateBrandFontSizes } from "./generators/font-sizes/brand-font-sizes-generator";
import { generateMisticaFontSizes } from "./generators/font-sizes/mistica-font-sizes-generator";
import { generateBrandFontWeights } from "./generators/font-weights/brand-font-weights-generator";
import { generateMisticaFontWeights } from "./generators/font-weights/mistica-font-weights-generator";
import { downloadTokens } from "./token-downloader";
import { generateBrandCornerRadius } from "./generators/corner-radius/brand-corner-radius-generator";
import { generateMisticaColors } from "./generators/colors/mistica-colors-generator";
import { generateMisticaColor } from "./generators/colors/mistica-color-generator";
import { reduceColors } from "./generators/colors/reduce-colors";
import { generateColorToolkit } from "./generators/colors/color-toolkit-generator";
import { generateUIColorToolkit } from "./generators/colors/uicolor-toolkit-generator";
import { generateBrandColors } from "./generators/colors/brand-colors-generator";

const BRANDS = [
  {
    id: "blau",
    prefix: "Blau",
    misticaDesignFileName: "blau",
  },
  {
    id: "movistar",
    prefix: "Movistar",
    misticaDesignFileName: "movistar",
  },
  {
    id: "o2new",
    prefix: "O2New",
    misticaDesignFileName: "o2-new",
  },
  {
    id: "o2",
    prefix: "O2",
    misticaDesignFileName: "o2",
  },
  {
    id: "telefonica",
    prefix: "Telefonica",
    misticaDesignFileName: "telefonica",
  },
  {
    id: "tu",
    prefix: "Tu",
    misticaDesignFileName: "tu",
  },
  {
    id: "vivoNew",
    prefix: "VivoNew",
    misticaDesignFileName: "vivo-new",
  },
  {
    id: "vivo",
    prefix: "Vivo",
    misticaDesignFileName: "vivo",
  },
];

const BRANCH = "production";

const run = async () => {
  const brandsWithTokens = await Promise.all(
    BRANDS.map((brand) => {
      console.log(
        `Getting ${brand.misticaDesignFileName} tokens from mistica-design/${BRANCH}...`
      );
      return downloadTokens(BRANCH, brand.misticaDesignFileName).then(
        (tokens) => ({
          brand,
          tokens,
        })
      );
    })
  );
  const anyBrandTokens = brandsWithTokens[0].tokens;

  // Font weights
  console.log(`Generating MisticaFontWeights.swift...`);
  const misticaFontWeights = generateMisticaFontWeights(anyBrandTokens);
  fs.writeFileSync(
    "../../Sources/MisticaCommon/Fonts/MisticaFontWeights.swift",
    misticaFontWeights
  );

  // Font sizes
  console.log(`Generating MisticaFontSizes.swift...`);
  const misticaFontSizes = generateMisticaFontSizes(anyBrandTokens);
  fs.writeFileSync(
    "../../Sources/MisticaCommon/Fonts/MisticaFontSizes.swift",
    misticaFontSizes
  );

  // Corner radius
  console.log(`Generating MisticaCornerRadius.swift...`);
  const misticaCornerRadius = generateMisticaCornerRadius(anyBrandTokens);
  fs.writeFileSync(
    "../../Sources/MisticaCommon/Radius/MisticaCornerRadius.swift",
    misticaCornerRadius
  );

  // Colors
  console.log(`Generating MisticaColors.swift...`);
  const colors = reduceColors(brandsWithTokens);
  const misticaColors = generateMisticaColors(colors);
  fs.writeFileSync(
    "../../Sources/MisticaCommon/Colors/MisticaColors.swift",
    misticaColors
  );

  console.log(`Generating MisticaColor.swift...`);
  const misticaColor = generateMisticaColor(colors);
  fs.writeFileSync(
    "../../Sources/MisticaCommon/Colors/MisticaColor.swift",
    misticaColor
  );

  console.log(`Generating ColorToolkit+Color.swift...`);
  const colorToolkit = generateColorToolkit(colors);
  fs.writeFileSync(
    "../../Sources/MisticaCommon/Colors/ColorToolkit+Color.swift",
    colorToolkit
  );

  console.log(`Generating ColorToolkit+UIColor.swift...`);
  const uicolorToolkit = generateUIColorToolkit(colors);
  fs.writeFileSync(
    "../../Sources/MisticaCommon/Colors/ColorToolkit+UIColor.swift",
    uicolorToolkit
  );

  brandsWithTokens.forEach((brandWithTokens) => {
    // Font weights
    console.log(
      `Generating ${brandWithTokens.brand.prefix}FontWeights.swift...`
    );
    const brandFontWeights = generateBrandFontWeights(
      brandWithTokens.brand,
      brandWithTokens.tokens
    );
    fs.writeFileSync(
      `../../Sources/MisticaCommon/Fonts/Brands/${brandWithTokens.brand.prefix}FontWeights.swift`,
      brandFontWeights
    );

    // Font sizes
    console.log(`Generating ${brandWithTokens.brand.prefix}FontSizes.swift...`);
    const brandFontSizes = generateBrandFontSizes(
      brandWithTokens.brand,
      brandWithTokens.tokens
    );
    fs.writeFileSync(
      `../../Sources/MisticaCommon/Fonts/Brands/${brandWithTokens.brand.prefix}FontSizes.swift`,
      brandFontSizes
    );

    // Corner radius
    console.log(
      `Generating ${brandWithTokens.brand.prefix}CornerRadius.swift...`
    );
    const brandCornerRadius = generateBrandCornerRadius(
      brandWithTokens.brand,
      brandWithTokens.tokens
    );
    fs.writeFileSync(
      `../../Sources/MisticaCommon/Radius/Brands/${brandWithTokens.brand.prefix}CornerRadius.swift`,
      brandCornerRadius
    );

    // Colors
    console.log(
      `Generating ${brandWithTokens.brand.prefix}ColorPalette.swift...`
    );
    const brandColors = generateBrandColors(
      brandWithTokens.brand,
      colors,
      brandWithTokens.tokens.global.palette
    );
    fs.writeFileSync(
      `../../Sources/MisticaCommon/Colors/${brandWithTokens.brand.prefix}ColorPalette.swift`,
      brandColors
    );
  });
};

run();
