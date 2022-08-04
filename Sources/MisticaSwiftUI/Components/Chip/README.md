#  Chip

The `Chip` is view which can be configured for several purposes:
- As a selectable view: the view will work as a toggle button.
- As a dismissible view: the view cannot be selected and a close button will appear in the right side of the view.

## Usage

The `Chip` is used as any other view.

Depending on the purpose, you have to initialize it using the right initializer:

### Selectable chip

```swift
Chip(style: style,
     text: text,
     icon: icon,
     isSelected: isSelected)
```

- `style`: available appearances of this component.
- `text`: the content shown in the view.
- `icon`: (optional) the icon placed in the left side.
- `isSelected`: a bindable boolean which means if the `Chip` is selected or not. It is based on the tap on the whole view.

### Dismissible chip

```swift
Chip(style: style,
     text: text,
     icon: icon,
     onDismiss: onDismiss)
```

- `style`: available appearances of this component.
- `text`: the content shown in the view.
- `icon`: (optional) the icon placed in the left side.
- `onDismiss`: a block which is executed when the close button is tapped.

Spec: https://www.figma.com/file/512a5Ke4EldL0GYffCXGCJ/Chips-Specs
