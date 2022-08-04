#  RadioButton

The RadioButton offers a binary choice.

## Usage

The **RadioButton** is used as any other view. 

The component has two mechanisms for notify when the value changes. You can use the `onValueChanged` close

```swift
radioButton.onValueChanged = { activated in
    // do something
}
```

or using the target-action pattern of UIControl. RadioButton only send actions for `UIControl.Event.valueChanged`,

```swift
radioButton.addTarget(self, action: #selector(radiobuttonTapped), for: .valueChanged)
``
