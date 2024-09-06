import fs from 'fs';
import {resolve} from 'path';
import {generateBrandFontSizes} from '../brand-font-sizes-generator.js';

test('generateBrandFontSizes', () => {
    const anyBrandTokensPath = resolve(__dirname, 'any-brand-tokens.json');
    const anyBrandTokens = JSON.parse(fs.readFileSync(anyBrandTokensPath, 'utf-8'));
    const brand = {prefix: 'O2New'};
    const result = generateBrandFontSizes(brand, anyBrandTokens);

    expect(result).toMatchSnapshot();
});
