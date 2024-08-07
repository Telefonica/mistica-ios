import fs from 'fs';
import {resolve} from 'path';
import {reduceColors} from '../reduce-colors.js';
import {generateMisticaColors} from '../mistica-colors-generator.js';

test('generateMisticaColors', () => {
    const getTokensFromFile = (file) => JSON.parse(fs.readFileSync(resolve(__dirname, file), 'utf-8'));
    const brandsWithTokens = [
        {
            brand: {
                id: 'brand1',
                prefix: 'Brand1',
                misticaDesignFileName: 'brand-1',
            },
            tokens: getTokensFromFile('brand1-tokens.json'),
        },
        {
            brand: {
                id: 'brand2',
                prefix: 'Brand2',
                misticaDesignFileName: 'brand-2',
            },
            tokens: getTokensFromFile('brand2-tokens.json'),
        },
    ];

    const colors = reduceColors(brandsWithTokens);
    const result = generateMisticaColors(colors);

    expect(result).toMatchSnapshot();
});
