# HighlightedCard
HighlightedCard has two styles `inverse` and `normal`

|  Normal  |    Inverse    |
|----------|:-------------:|
| ![custom](./docs/images/highlighted-card-normal.png) |  ![custom](./docs/images/highlighted-card-inverse.png) |

Both styles share the same anatomy, described below from top to down

* **Title**: non optional
* **Subtitle**: non optional
* **Action**: optional.
* **Close Action**: optional
* **Right Image**: optional
* **Background Image**: optional

## Usage

The **HighlightedCard()** is used as any other view. 

```swift
let highlightedCard = HighlightedCard()
highlightedCard.title = "Welcome"
highlightedCard.showCloseButton = true
```

When using with autolayout, **HighlightedCard** has no intrinsic size for the width but it has an specific intrinsic size for the height.
