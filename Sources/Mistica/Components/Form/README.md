# FormView

The `FormView.swift` class can render a set of `InputField`s with support a set of useful features for them.  

- Auto-jump between every `InputField`.
- Animated layout of every `InputField`.
- Sizing and layout of every `InputField`.
- Field validation on submit.
- Scrolling if needed.
- DynamicType.

## Usage

Create an instance of `FormView`.

```swift
let formView = FormView()
```

Add new inputs. Inputs will be listed in the order they are inserted.

```swift
let username = InputField(style: .email)
let password = InputField(style: .password)

formView.addInputFields([username, password])
```

You can also add custom views as headers or footers.

```swift
let formView = FormView()
let headerView = UILabel()
headerView.text = "Change email"

formView.addHeaderView(headerView)
```

There are three kinds of custom views:
- `headerView`: Placed at top of the form (above the first input).
- `detailView`: Placed in the middle of the form (between the last input and the submit button).
- `footerView`: Placed at the bottom of the form (below submit button).

![custom](./docs/images/form.png)

Note that the `FormView` manages the scrolling of the form, so there may be cases where using those custom views is useful. 

## Sizing

Forms have an intrinsic content size that matches the current content. Note that the inputs can grow vertically so you shouldn't force a specific height. Usually, the only thing you have do is to constrain it to the edges of the screen.
