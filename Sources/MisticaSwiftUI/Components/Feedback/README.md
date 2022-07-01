#  Feedbacks

The Feedback view will be in charge of rendering different types of feedbacks. Its content is customisable while the appearance is automatically configured per brand based on the selected feedback style. Background color, icon, animations, fonts and colors are predefined and can't be changed.

![custom](./docs/images/sample.png)


## Parameters

### Title and Subtitle

Multiline strings that will be positioned one below the other. If the content is large enough the view will scroll.

### Style

There are three styles available: `.success`, `.informative` and `.error`:

| Success     | Informative     | Error     |
|-------------|-----------------|-----------|
| ![custom](./docs/images/success.png) | ![custom](./docs/images/informative.png) | ![custom](./docs/images/error.png) |

All styles, if presented modally, will show a 'close' button. If they are presented with a push, a back button will show up except when the style is `success`. In that case the actions should dismiss this screen.

### Primary Button

For the primary action, a Feedback with a single primary button can be created: 

- **Button:**
```swift
Feedback(
    style: .informative,
    title: "Title",
    message: "Message"
) {
    Button("Primary") { ... }
}
```

### Button Action

For the secondary action, there are three different options: 

- **Button:** 
```swift
Feedback(
    style: .informative,
    title: "Title",
    message: "Message"
) {
    Button("Primary") { ... }
} secondaryButton: {
    Button("Secondary") { ... }
}
```
- **Link:** 
```swift
Feedback(
    style: .informative,
    title: "Title",
    message: "Message"
) {
    Button("Primary") { ... }
} linkButton: {
    Button("Secondary") { ... }
}
```
- **No button:**
```swift
Feedback(
    style: .informative,
    title: "Title",
    message: "Message"
) {
    Button("Primary") { ... }
}
```

| Button    | Link     | None |
|-------------|-----------------|-----------|
| ![custom](./docs/images/secondary-button.png) | ![custom](./docs/images/secondary-link.png)  | ![custom](./docs/images/secondary-none.png) |

### Extra Content

An extra `View` can be provided to be placed below the subtitle. It will keep the same margins than the view above so no constraints should be required in order to properly align it with the rest of the content.

## Usage

Just create a `Feedback` with the required parameters. For example, a success feedback with a link secondary action and an extra view:

```swift
 Feedback(
     style: .informative,
     title: "Title",
     message: "Message"
 ) {
     VStack(alignment: .leading, spacing: 10) {
         Text("This extra view is optional")
             .font(.textPreset3(weight: .regular))
             .foregroundColor(.textPrimary)
         Text("Any UIView is allowed here")
             .font(.textPreset3(weight: .regular))
             .foregroundColor(.textPrimary)
         Text("It will always be placed below the subtitle")
             .font(.textPreset3(weight: .regular))
             .foregroundColor(.textPrimary)
         Text("It will be animated along the other text")
             .font(.textPreset3(weight: .regular))
             .foregroundColor(.textPrimary)
     }
 } primaryButton: {
     Button("Primary") { }
 } linkButton: {
     Button("Secondary") { }
 }
```
