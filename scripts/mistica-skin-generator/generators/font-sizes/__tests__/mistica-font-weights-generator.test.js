import fs from "fs";
import { resolve } from "path";
import { generateMisticaFontSizes } from "../mistica-font-sizes-generator";

test("generateMisticaFontSizes", () => {
  const anyBrandTokensPath = resolve(__dirname, "any-brand-tokens.json");
  const anyBrandTokens = JSON.parse(
    fs.readFileSync(anyBrandTokensPath, "utf-8")
  );
  const result = generateMisticaFontSizes(anyBrandTokens);

  const expectedContentPath = resolve(
    __dirname,
    "expected-mistica-font-sizes.swift"
  );
  const expectedContent = fs.readFileSync(expectedContentPath, "utf-8");
  expect(result).toBe(expectedContent);
});
