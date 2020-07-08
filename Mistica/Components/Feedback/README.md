#  Feedbacks

The Feedback view will be in charge of rendering different types of feedbacks. Its content is customisable while the appearance is automatically configured per brand based on the selected feedback style. Background color, icon, animations, fonts and colors are predefined and can't be changed.

![custom](./docs/images/sample.png)


## Configurable options

### Title and Subtitle

Multiline strings that will be positioned one below the other. If the content is large enough the view will scroll.

### Style

There are three styles available: `.success`, `.informative` and `.error`:

| Success     | Informative     | Error     |
|-------------|-----------------|-----------|
| ![custom](./docs/images/success.png) | ![custom](./docs/images/informative.png) | ![custom](./docs/images/error.png) |

All styles, if presented modally, will show a 'close' button. If they are presented with a push, a back button will show up except when the style is `success`. In that case the actions should dismiss this screen.

### Primary Action

The primary action button is optional. The title and action can be configured when creating the `FeedbackConfiguration`:

```swift
FeedbackPrimaryAction.button(title: "Primary button", completion: { ... })
```

### Secondary Action

For the secondary action, there are three different options: 

- **Button:** `FeedbackSecondaryAction.button(title: "Secondary button", completion: { ... })`
- **Link:** `FeedbackSecondaryAction.link(title: "Secondary button", completion: { ... })`
- **No button:** `FeedbackSecondaryAction.none`

| Button    | Link     | None |
|-------------|-----------------|-----------|
| ![custom](./docs/images/secondary-button.png) | ![custom](./docs/images/secondary-link.png)  | ![custom](./docs/images/secondary-none.png) |

### Extra Content

An extra `UIView` can be provided to be placed below the subtitle. It will keep the same margins than the view above so no constraints should be required in order to properly align it with the rest of the content.

## Usage

Import `CommonUIKit` and create a `FeedbackConfiguration` with the required parameters. For example, a configuration for a success feedback with a link secondary action and an extra view:

```swift
FeedbackConfiguration(style: .success,
                      title: "Title",
                      subtitle: "Subtitle",
                      primaryAction: .button(title: "Primary Action", completion:{ ... }),
                      secondaryAction: .link(title: "Secondary Action", completion:{ ... }),
                      extraContent: CustomExtraUIView())
```

The configuration can be simplified if only the required parameters are provided, by default there's no secondary action and extra content view:

```swift
FeedbackConfiguration(style: .success,
                      title: "Title",
                      subtitle: "Subtitle",
                      primaryAction: .button(title: "Primary Action", completion:{ ... }))
```

Once the configuration is created, use the `feedbackNavigator` available in the `CommonUIKitAssembly` to `push` or `present` the feedback view:

```swift
feedbackNavigator.pushFeedback(configuration: configuration)
```

```swift
feedbackNavigator.presentFeedback(configuration: configuration)
```




