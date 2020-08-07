# Mistica Appearance

Mistica provides styles for some `UIControl`s, at this moment the `UIControl`s are

- UISwitch
- UIPageControl
- UISegmentedControl
- UITabBar

The `UIControl`s are styled using [UIAppearance](https://developer.apple.com/documentation/uikit/uiappearance) proxy.

## Usage

After the `brandStyle` is configured and before you instanteate you UI, you can style all the `UIControl`s

```swift
// Configure brand style before initializing the UI
Mistica.brandStyle = .movistar
Mistica.styleControls(MisticaControlStyle.allCases)
```

Or you can select which `UIControl`s are styled

```swift
// Configure brand style before initializing the UI
Mistica.brandStyle = .movistar
Mistica.styleControls([.pageControl, .switch])
```