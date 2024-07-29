import fs from "fs";
import { resolve } from "path";
import { generateMisticaFontWeights } from "../mistica-font-weights-generator";

test("generateMisticaFontWeights", () => {
  const anyBrandTokensPath = resolve(__dirname, "any-brand-tokens.json");
  const anyBrandTokens = JSON.parse(
    fs.readFileSync(anyBrandTokensPath, "utf-8")
  );
  const result = generateMisticaFontWeights(anyBrandTokens);

  const expectedContentPath = resolve(
    __dirname,
    "expected-mistica-font-weights.swift"
  );
  const expectedContent = fs.readFileSync(expectedContentPath, "utf-8");
  expect(result).toBe(expectedContent);
});
