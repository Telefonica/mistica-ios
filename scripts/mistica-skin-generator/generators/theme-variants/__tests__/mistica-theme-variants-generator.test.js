import fs from 'fs';
import {resolve} from 'path';
import {generateMisticaThemeVariants} from '../mistica-theme-variants-generator.js';

test('generateMisticaThemeVariants', () => {
    const anyBrandTokensPath = resolve(__dirname, 'any-brand-tokens.json');
    const anyBrandTokens = JSON.parse(fs.readFileSync(anyBrandTokensPath, 'utf-8'));
    const result = generateMisticaThemeVariants(anyBrandTokens);

    expect(result).toMatchSnapshot();
});
