export const generateMisticaColors = (colors) =>
  template(Object.entries(colors));

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import UIKit

public protocol MisticaColors {
${props
  .map((prop) => `    var ${prop[0]}: ${prop[1].commonType} { get }`)
  .join("\n")}
}
`;
