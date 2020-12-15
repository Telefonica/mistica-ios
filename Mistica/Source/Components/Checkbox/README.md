#  Checkbox

The Checkbox offers a binary choice.

## Usage

The **Checkbox** is used as any other view. 

The component has two mechanisms for notify when the value changes. You can use the `onValueChanged` close

```swift
checkbox.onValueChanged = { checked in
    // do something
}
```

or using the target-action pattern of UIControl. Checkbox only send actions for `UIControl.Event.valueChanged`,

```swift
checkbox.addTarget(self, action: #selector(checkboxTapped), for: .valueChanged)
``
