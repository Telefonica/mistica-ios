#  Mistica

[![Platform](https://img.shields.io/badge/platforms-iOS-orange.svg)](https://github.com/Telefonica/mistica-ios)
[![Languages](https://img.shields.io/badge/languages-ObjC%20%7C%20Swift-orange.svg)](https://github.com/Telefonica/mistica-ios)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-59C939.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods compatible](https://img.shields.io/badge/CocoaPods-compatible-59C939.svg?style=flat)](https://cocoapods.org/)

Mistica is a framework that contains reusable UI components and utilities.

## Instalation

### Carthage



### Cocoapods




### Swift Package Manager

Support for SPM will be considered after the release of Xcode 12 and the new support of packages with resources.


## Configuration

By default the framework components are created with the Movistar's brand style and the `standard` theme variant, to select a different one, configure the brand style and/or variant:

```swift
Mistica.brandStyle = .o2
Mistica.themeVariant = .prominent
```

### Override translations

Not yet supported


## Components

* [Button](./Mistica/Components/Button/)
* [Crouton](./Mistica/Components/Crouton/)
* [SegmentSelector](./Mistica/Components/SegmentSelector/)
* [Feedbacks](./Mistica/Components/Feedback/)
* [Tooltip](./Mistica/Components/Tooltip/)
* [ViewStates](./Mistica/Components/ViewStates/)
* [Badge](./Mistica/Components/Badge/)
* [InputFields](./Mistica/Components/InputField/)
* [ScrollContentIndicator](./Mistica/Components/ScrollContentIndicator/)
* [Lists](./Mistica/Components/Lists/)
* [SectionTitle](./Mistica/Components/SectionTitle/)
* [Header](./Mistica/Components/Header/)


## Contributing

To create or modify components from the Mistica library follow the next steps:

1. Clone this repo

2. Use carthage to update Mistica's dependencies (Lottie)

```swift
carthage update --platform iOS
```

> Once Lottie provides support to SPM with dynamic dependencies, carthage requirements will be removed.

3. Open `Mistica.xcodeproj`

4. Place the new component under the `Components` folder. The component should have a proper definition by the design team.

When implementing the component, try to have in mind the following guidelines:

* The component should be implemented to be reusable. Make it generic enough so that other teams can also use it.
* Make sure the component reiszes correctly (we support iPad multitasking, so any screen can resize at any given time).
* Don't forget accessibility (VoiceOver, Dynamic Type...).
* Pay attention to user interaction (Gestures, Haptics, 3D Touch...)
* Although this should be transparent to you, take into account themes and multiple brands.
* To help other developers, add documentation about the new component.

> Future versions will include a sample app or catalog to test those components. Once the catalog is available, don't forget to include new components on it.
