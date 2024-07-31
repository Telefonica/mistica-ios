import fs from 'fs';
import {resolve} from 'path';
import {generateMisticaFontSizes} from '../mistica-font-sizes-generator';

test('generateMisticaFontSizes', () => {
    const anyBrandTokensPath = resolve(__dirname, 'any-brand-tokens.json');
    const anyBrandTokens = JSON.parse(fs.readFileSync(anyBrandTokensPath, 'utf-8'));
    const result = generateMisticaFontSizes(anyBrandTokens);

    expect(result).toMatchSnapshot();
});
