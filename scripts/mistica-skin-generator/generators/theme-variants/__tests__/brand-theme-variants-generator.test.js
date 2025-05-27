import fs from 'fs';
import {resolve} from 'path';
import {generateBrandThemeVariants} from '../brand-theme-variants-generator.js';

test('generateBrandThemeVariants', () => {
    const anyBrandTokensPath = resolve(__dirname, 'any-brand-tokens.json');
    const anyBrandTokens = JSON.parse(fs.readFileSync(anyBrandTokensPath, 'utf-8'));
    const brand = {prefix: 'O2New'};
    const result = generateBrandThemeVariants(brand, anyBrandTokens);

    expect(result).toMatchSnapshot();
});
