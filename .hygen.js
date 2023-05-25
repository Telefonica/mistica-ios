const fs = require('fs')

module.exports = {
  helpers: {
    colorFromString: (s,className) => {
        if (s.includes("rgba")) {
          let splitted = s.replace("rgba({","").replace("}, ",",").replace(")","").replace(" ","").split(",")
          let colorName = splitted[0]
          let alphaComponent = splitted[1]
          return className + "Colors." + colorName + ".withAlphaComponent(" + alphaComponent + ")"
        } else {
          let colorName = s.replace("{","").replace("}","")
          return className + "Colors." + colorName
        }
    },
    params: (json) => {
      let jsonData = {}
      if (json) {
        let rawdata = fs.readFileSync(json);
        jsonData = JSON.parse(rawdata);
      }
      return {
        jsonData
      }
    },
  },
}
