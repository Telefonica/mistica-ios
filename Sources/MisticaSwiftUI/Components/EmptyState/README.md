# Empty State

Empty State is an UI element made up by an Asset as an icon, small image or fullwidth with some text and actions.

It could be represented as a card or just a view.

All the elements are optional except the Asset and the title that are mandatory.

## How to use an Empty State

Create an `EmptyState` with the required parameters. For example, a basic configuration

```swift
EmptyState(
    assetType: .image(.someImage),
    title: "Title",
    description: "Description",
    primaryButton: { Button("Primary") {} },
    secondaryButton: { Button("Secondary") {} }
)
```
