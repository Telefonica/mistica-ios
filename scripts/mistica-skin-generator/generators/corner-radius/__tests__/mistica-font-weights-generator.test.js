import fs from "fs";
import { resolve } from "path";
import { generateMisticaCornerRadius } from "../mistica-corner-radius-generator";

test("generateMisticaCornerRadius", () => {
  const anyBrandTokensPath = resolve(__dirname, "any-brand-tokens.json");
  const anyBrandTokens = JSON.parse(
    fs.readFileSync(anyBrandTokensPath, "utf-8")
  );
  const result = generateMisticaCornerRadius(anyBrandTokens);

  const expectedContentPath = resolve(
    __dirname,
    "expected-mistica-corner-radius.swift"
  );
  const expectedContent = fs.readFileSync(expectedContentPath, "utf-8");
  expect(result).toBe(expectedContent);
});
