import fs from "fs";
import { resolve } from "path";
import { generateBrandFontSizes } from "../brand-font-sizes-generator";

describe("generateBrandFontSizes", () => {
  it("real case", () => {
    const anyBrandTokensPath = resolve(__dirname, "any-brand-tokens.json");
    const anyBrandTokens = JSON.parse(
      fs.readFileSync(anyBrandTokensPath, "utf-8")
    );
    const brand = { prefix: "O2New" };
    const result = generateBrandFontSizes(brand, anyBrandTokens);

    const expectedContentPath = resolve(
      __dirname,
      "expected-o2-new-font-sizes.swift"
    );
    const expectedContent = fs.readFileSync(expectedContentPath, "utf-8");
    expect(result).toBe(expectedContent);
  });
});
