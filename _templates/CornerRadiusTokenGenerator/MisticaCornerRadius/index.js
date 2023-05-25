const fs = require('fs')

module.exports = {
  params: ({ args }) => {
    let jsonData = {}
    if (args.json) {
      let rawdata = fs.readFileSync(args.json);
      jsonData = JSON.parse(rawdata);
    }
    return {
      ...args,
      jsonData
    }
  },
}