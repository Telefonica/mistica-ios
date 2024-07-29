export const generateMisticaColors = (colors) =>
  template(Object.entries(colors));

const template = (props) => `
// Generated using Make
// DO NOT EDIT

import UIKit

public protocol MisticaColors {
${props
  .map(([name, color]) => `    var ${name}: ${color.commonType} { get }`)
  .join("\n")}
}
`;
