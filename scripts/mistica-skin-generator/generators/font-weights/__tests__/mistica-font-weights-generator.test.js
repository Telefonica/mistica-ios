import fs from 'fs';
import {resolve} from 'path';
import {generateMisticaFontWeights} from '../mistica-font-weights-generator.js';

test('generateMisticaFontWeights', () => {
    const anyBrandTokensPath = resolve(__dirname, 'any-brand-tokens.json');
    const anyBrandTokens = JSON.parse(fs.readFileSync(anyBrandTokensPath, 'utf-8'));
    const result = generateMisticaFontWeights(anyBrandTokens);

    expect(result).toMatchSnapshot();
});
