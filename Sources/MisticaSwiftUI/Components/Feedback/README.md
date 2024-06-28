#  Feedbacks

The Feedback view will be in charge of rendering different types of feedbacks. Its content is customisable while the appearance is automatically configured per brand based on the selected feedback style. Background color, icon, animations, fonts and colors are predefined and can't be changed.

<img src="./docs/images/success-with-content.png" width=250 /> <img src="./docs/images/success.png" width=250 />

### Usage

With trailing closure syntax:
```swift
Feedback(
    style: .informative,
    title: "Title",
    message: "Message"
) {
    Text("This extra view is optional")
} primaryButton: {
    Button("Primary") {}
} secondaryButton: {
    Button("Secondary") {}
} linkButton: {
    Button("Link") {}
}
```

## Parameters

### Title and Subtitle

Multiline strings that will be positioned one below the other. If the content is large enough the view will scroll.

### Style

There are three fixed styles available: `.success`, `.informative` and `.error`. There's one custom style `.feedback(image)` that can be used to provide an icon that will be used instead of the fixed ones:

 Success        | Informative   | Error         | Feedback        
:--------------:|:-------------:|:-------------:|:---------------:
![success](./docs/images/success.png) | ![informative](./docs/images/informative.png) | ![error](./docs/images/error.png) | ![feedback](./docs/images/feedback.png)

### Primary Button

For the primary action, a Feedback with a single primary button can be created: 

```swift
Feedback(
    style: .success,
    title: "Title",
    message: "Message",
    primaryButton: {
        Button("Primary") {}
    }
)
```

### Secondary Button

For the secondary action, a Feedback with a single secondary button can be created: 

```swift
Feedback(
    style: .success,
    title: "Title",
    message: "Message",
    secondaryButton: {
        Button("Secondary") {}
    }
)
```

### Link Button

For the link action, a Feedback with a single link button can be created: 

```swift
Feedback(
    style: .success,
    title: "Title",
    message: "Message",
    linkButton: {
        Button("Link") {}
    }
)
```

You can have other combinations with primary, secondary and link buttons so please explore the available initialisers.

### Extra Content

An extra `View` can be provided to be placed below the subtitle. It will keep the same margins than the view above so no constraints should be required in order to properly align it with the rest of the content.
