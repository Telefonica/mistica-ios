/**
 *
 * @param {string} branch
 * @param {string} brand
 * @returns {Promise<any>}
 */
export const downloadTokens = async (branch, brand) => {
    const response = await fetch(
        `https://raw.githubusercontent.com/Telefonica/mistica-design/${branch}/tokens/${brand}.json`
    );
    return response.json();
};
