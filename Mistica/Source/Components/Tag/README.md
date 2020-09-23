# Tag

This view consists of a label to display text with a defined style. It is also known as _Promotional Tag_.

![sample](./docs/images/sample.png)

## Properties

### Text

Content which will be presented as uppercased with center text alignment.

## Intrinsic content size

This view can resolve its size (`intrinsicContentSize`) depending on its child elements so a specific width/height is not required. Basically it will depend on the `text`, which has a minimum width for small content. It will crop the content when the `text` is longer for one line label.

![min-max-size](./docs/images/min-max-size.gif)

## Accessibility

The `Tag` is responsive to dynamic type changes so its internal label will increase/decrease the whole component when that value changes.

![accessibility](./docs/images/accessibility.gif)
