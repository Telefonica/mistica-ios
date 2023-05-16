// _templates/ColorTokenGenerator/MisticaColors/index.js
const fs = require('fs')

module.exports = {
  params: ({ args }) => {
    let jsonData = {}
    if (args.json) {
      let rawdata = fs.readFileSync(args.json);
      jsonData = JSON.parse(rawdata);
      console.log(jsonData.light.background.value)
    }
    return {
      ...args,
      jsonData
    }
  },
}