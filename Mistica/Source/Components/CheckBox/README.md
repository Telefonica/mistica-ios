#  CheckBox

The CheckBox offers a binary choice.

## Usage

The **CheckBox** is used as any other view. 

The component has two mechanisms for notify when the value changes. You can use the `onValueChanged` close

```swift
checkBox.onValueChanged = { checked in
    // do something
}
```

or using the target-action pattern of UIControl. CheckBox only send actions for `UIControl.Event.valueChanged`,

```swift
checkBox.addTarget(self, action: #selector(checkBoxTapped), for: .valueChanged)
``
