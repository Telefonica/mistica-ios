# Fonts

By default mistica uses the system font, but it can be overriden with the Telefónica ones:

- [OnAir](https://brandfactory.telefonica.com/document/2372#/nuestra-identidad/tipografia)
- [Telefonica](https://brandfactory.telefonica.com/document/483#/nuestra-identidad-new/tipografia)

## How to override the default font

1. Download the fonts from the links above. OTF or TTF fonts are preferred, and we only need three weights: light, regular and medium.
2. Add all three font files to your app Resources and make sure that they are added to your app target.
3. Include them in your app plist under the key `Fonts provided by application`. Inside you need to specify all three font files, for example: `Telefonica-Light.otf`, `Telefonica-Regular.otf` and `Telefonica-Medium.otf`.
4. Configure the Mistica framework to use this font. In your app delegate or in other place before any view is created, set up the `fontNameForWeight` property for SwiftUI code and `UIfontNameForWeight property` for UIKit:

```swift
// For SwiftUI
FontStyle.fontNameForWeight = { weight in
    switch weight {
    case .light, .ultraLight, .thin:
        return "Telefonica-Light"
    case .regular:
        return "Telefonica-Regular"
    case .medium, .bold, .semibold, .black, .heavy:
        return "Telefonica-Bold"
    default:
        return "Telefonica-Regular"
    }
}

// For UIKit
FontStyle.UIfontNameForWeight = { weight in
    switch weight {
    case .light, .ultraLight, .thin:
        return "Telefonica-Light"
    case .regular:
        return "Telefonica-Regular"
    case .medium, .bold, .semibold, .black, .heavy:
        return "Telefonica-Bold"
    default:
        return "Telefonica-Regular"
    }
}
```

If you have further issues, [this checklist](https://codewithchris.com/common-mistakes-with-adding-custom-fonts-to-your-ios-app/) is a pretty good way of fixing them.
