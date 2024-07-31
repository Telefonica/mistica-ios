import fs from 'fs';
import {resolve} from 'path';
import {generateBrandFontWeights} from '../brand-font-weights-generator';

test('generateBrandFontWeights', () => {
    const anyBrandTokensPath = resolve(__dirname, 'any-brand-tokens.json');
    const anyBrandTokens = JSON.parse(fs.readFileSync(anyBrandTokensPath, 'utf-8'));
    const brand = {prefix: 'O2New'};
    const result = generateBrandFontWeights(brand, anyBrandTokens);

    expect(result).toMatchSnapshot();
});
