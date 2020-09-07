<br>
<br>
<img height="64" alt="Mística for iOS" src="./mistica-logo.svg">
<br>

#  Mistica for iOS

[![Platform](https://img.shields.io/badge/platform-iOS-%23989898.svg)](https://github.com/Telefonica/mistica-ios)
[![iOS Version](https://img.shields.io/badge/Support-%3E%3D%20iOS%2011.0-brightgreen.svg)](https://github.com/Telefonica/mistica-ios)
[![Languages](https://img.shields.io/badge/languages-Swift-orange.svg)](https://github.com/Telefonica/mistica-ios)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-59C939.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods compatible](https://img.shields.io/badge/CocoaPods-compatible-59C939.svg?style=flat)](https://cocoapods.org/)

Mistica is a framework that contains reusable UI components and utilities.

## Instalation

### Carthage

Add Mistica to your `Cartfile`:

```
github "Telefonica/mistica-ios" "master"
```

And then run:

```
carthage update --platform iOS --use-ssh
```

> More information about Carthage integration [here](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos)

### Cocoapods

Add Mistica to your `Podfile`:

```
pod 'Mistica', :git => 'git@github.com:Telefonica/mistica-ios.git'
```

And then run:

```
pod install
```

### Swift Package Manager

Support for SPM will be considered after the release of Xcode 12 and the new support of swift packages with resources.

## Configuration

By default the framework components are created with the Movistar's brand style and the `standard` theme variant, to select a different one, configure the brand style and/or variant:

```swift
Mistica.brandStyle = .o2
Mistica.themeVariant = .prominent
```

Remember to initialize Mistica with you desired brand style before the initialize the UI of your app.

In applications before iOS 13, the initialziation should be done in **UIApplicationDelegate**,

```swift
func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Set up Mistica
    Mistica.brandStyle = .vivo
    
    return true
}
```

For applications in iOS 13 and above, the initialization should be done in **SceneDelegate**

```swift
func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    // Configure brand style before initializing the UI
    Mistica.brandStyle = .movistar
}
```

## Components

* [Button](./Mistica/Components/Button/)
* [Crouton](./Mistica/Components/Crouton/)
* [SegmentSelector](./Mistica/Components/SegmentSelector/)
* [Feedbacks](./Mistica/Components/Feedback/)
* [Popover](./Mistica/Components/Popover/)
* [ViewStates](./Mistica/Components/ViewStates/)
* [Badge](./Mistica/Components/Badge/)
* [InputFields](./Mistica/Components/InputField/)
* [ScrollContentIndicator](./Mistica/Components/ScrollContentIndicator/)
* [Lists](./Mistica/Components/Lists/)
* [SectionTitle](./Mistica/Components/SectionTitle/)
* [Header](./Mistica/Components/Header/)


## Components Catalog

In `MisticaCatalog.framework` you can find a catalog with all the components of Mistica. In this catalog you can see the components in action.

<div align="center">
<img src="./doc/images/catalog.png" height=600/>
</div>

The instalation process is the same than for `Mistica.framework`.

And for showing the catalog you only need to show **UICatalogViewController**.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)
