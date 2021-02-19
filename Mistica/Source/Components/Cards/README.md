* [DataCard](#datacard)
   * [How to use a DataCard](#how-to-use-a-datacard)
   * [Adding extra content to a DataCard](#adding-extra-content-to-a-datacard)
* [MediaCard](#mediacard)
   * [How to use a MediaCard](#how-to-use-a-mediacard)
   * [Adding extra content to a MediaCard](#adding-extra-content-to-a-mediacard)
* [HighlightedCard](#highlightedcard)
   * [Right Image](#right-image)
   * [How to use a HighlightedCard](#how-to-use-a-highlightedcard)

## DataCard

DataCard is used to show relevant information (descriptions, data, statuses ...) of a user's product or service.

![DataCard](./docs/images/data-card.jpg)

### How to use a DataCard

Create a `DataCardConfiguration` with the required parameters. For example, a basic configuration

```swift
DataCardConfiguration(title: "title", descriptionTitle: "a detail text")
```

Once the configuration is created, set the configuration to `dataConfiguration` property.

```swift
let myDataCard = DataCard()
myDataCard.dataConfiguration = myConfiguration
```

### Adding extra content to a DataCard

A DataCard can be customized adding an extra view like

![DataCard](./docs/images/card-extra-content.jpg)

The extra `UIView` can be provided to be placed below the `descriptionTitle` property. It will keep the same margins than the view above so no constraints should be required in order to properly align it with the rest of the content.

The view is added as child view of a `UIStackView` with a vertical `axis` and a leading `aligment` so the view will take the whole aviable width of the card.

Both cards have a property named `fragmentView`, which you should use for add the extra content.

## MediaCard

MediaCard is used to show offers, services and rich media.

![DataCard](./docs/images/media-card.jpg)

### How to use a MediaCard

Create a `MediaCardConfiguration` with the required parameters. For example, a basic configuration

```swift
MediaCardConfiguration(richMedia: myRichMediaView, descriptionTitle: "a detail text")
```

Once the configuration is created, set the configuration to `dataConfiguration` property.

```swift
let myDataCard = MediaCard()
myDataCard.dataConfiguration = myConfiguration
```

### Adding extra content to a MediaCard

A MediaCard can be customized adding an extra view like

![MediaCard](./docs/images/card-extra-content.jpg)

The extra `UIView` can be provided to be placed below the `descriptionTitle` property. It will keep the same margins than the view above so no constraints should be required in order to properly align it with the rest of the content.

The view is added as child view of a `UIStackView` with a vertical `axis` and a leading `aligment` so the view will take the whole aviable width of the card.

Both cards have a property named `fragmentView`, which you should use for add the extra content.

## HighlightedCard

HighlightedCard has two styles `inverse` and `normal`

|  Normal  |    Inverse    |
|----------|:-------------:|
| ![custom](./docs/images/highlighted-card-normal.png) |  ![custom](./docs/images/highlighted-card-inverse.png) |

Both styles share the same anatomy, described below from top to down.

* **Close Action**: optional.
* **Title**: non optional.
* **Subtitle**: non optional.
* **Action**: optional.
* **Background Image**: optional.
* **Right Image**: optional.

### Right Image
The right image can be displayed using two modes: `fit` and `fill`.
- `Fit` mode will scale the image to fit it in the current available space. The image will be aligned vertically to the bottom, and horizontally to the right. This mode is useful for images with transparent backgrounds or small assets.
- `Fill` mode will scale the image to fill the current available space. The image will be aligned vertically to the center, and horizontally to the right. This mode is useful for large images.

| Mode      |    Example    |
|------------|:--------------:|
| Fill          | ![custom](./docs/images/highlighted-card-image-fill.png)  |
| Fit           | ![custom](./docs/images/highlighted-card-image-fit.png)  |

### How to use a HighlightedCard

The **HighlightedCard()** is used as any other view. 

```swift
let highlightedCard = HighlightedCard()
highlightedCard.title = "Welcome"
highlightedCard.showCloseButton = true
```

When using with autolayout, **HighlightedCard** has no intrinsic size for the width but it has an specific intrinsic size for the height.

# Accessibility

Cards are ready for VoiceOver. 
They will be as a unique element and if has buttons, them will be also focusable with VoiceOver.

VoiceOver will read the following components (in this particular order):
- headline
- title
- subtitle
- description

## Extra content Accessibility

If extra view is provided to the cell, extra view is reponsible about his accessibility and will be a focusable element for voice over inside the card like the buttons.
To provide a good Accessibility Experience watch [this video](https://developer.apple.com/videos/play/wwdc2018/230/) is highly recommended. 

This is an example extra view class that wil be an unique element for VoiceOver and will read Title and Text.

```swift
class ExtraView: UIView {
    private let titleLabel = UILabel()
    private let textLabel = UILabel()
    
    // Initializers...
    
    func configure(title: String, text: String) {
        titleLabel.text = title
        textLabel.text = text
        
        // Update the accessibility label with the
        // content to be readed by VoiceOver
        accessibilityLabel = "\(title) \(text)"
    }
    
    private func commonInit() {
        // Setup code...
        
        // Make this view as an accesible element to 
        // be focusable by VoiceOver.
        isAccessibleElement = true
    }
}

card.fragmentView = extraView
```


## Cards as Cells (UITableViewCell/UICollectionViewCell)

To use the cards as cells, as selectable items, set the `accessibilityTraits` of the Card to `[.button]` is recommended.
And double tap with the focused card will launch `didSelect` on table/collection delegate.

## UITapGesture

Same as working with cells, Cards can be tappables with `UITapGestureRecognizer`, setting the `accessibilityTrait` to `[.button]` is also recommended.
