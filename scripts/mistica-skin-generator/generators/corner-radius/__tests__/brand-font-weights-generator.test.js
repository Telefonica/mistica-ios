import fs from 'fs';
import {resolve} from 'path';
import {generateBrandCornerRadius} from '../brand-corner-radius-generator';

test('generateBrandCornerRadius', () => {
    const anyBrandTokensPath = resolve(__dirname, 'any-brand-tokens.json');
    const anyBrandTokens = JSON.parse(fs.readFileSync(anyBrandTokensPath, 'utf-8'));
    const brand = {prefix: 'O2New'};
    const result = generateBrandCornerRadius(brand, anyBrandTokens);

    expect(result).toMatchSnapshot();
});
