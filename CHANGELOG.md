# [7.1.0](https://github.com/Telefonica/mistica-ios/compare/v7.0.0...v7.1.0) (2021-01-20)


### Features

* **Stepper:** Add StepperView ([#59](https://github.com/Telefonica/mistica-ios/issues/59)) ([6174987](https://github.com/Telefonica/mistica-ios/commit/61749872d68833df6c624ea9fe234ba8270d6187))

# [7.0.0](https://github.com/Telefonica/mistica-ios/compare/v6.0.0...v7.0.0) (2021-01-12)


### Bug Fixes

* **Button:** Does not update automatically the view's layout margins to reflect the safe area. ([#58](https://github.com/Telefonica/mistica-ios/issues/58)) ([e408f07](https://github.com/Telefonica/mistica-ios/commit/e408f07f2212918196c298df9b331cdbef8cef7e))
* **Checkbox:** Rename CheckBox to Checkbox ([#53](https://github.com/Telefonica/mistica-ios/issues/53)) ([f66721f](https://github.com/Telefonica/mistica-ios/commit/f66721f85c138ea694e36f96a7c3f24f0b4f6fdb))


### BREAKING CHANGES

* **Checkbox:** Rename CheckBox to Checkbox

# [6.0.0](https://github.com/Telefonica/mistica-ios/compare/v5.0.0...v6.0.0) (2020-11-30)


### Bug Fixes

* **Mistica:** Remove unnecessary bundle resources ([#48](https://github.com/Telefonica/mistica-ios/issues/48)) ([97e7540](https://github.com/Telefonica/mistica-ios/commit/97e7540a28329b53d5e6df57bc7a19197d6e8872))


### Features

* **Lists:** APPS-6771 Icon changes on lists ([#31](https://github.com/Telefonica/mistica-ios/issues/31)) ([70c6d96](https://github.com/Telefonica/mistica-ios/commit/70c6d96012ed3e56b095d92f9bcaca48a64742a5))


### BREAKING CHANGES

* **Lists:** Lists assets API changed

# [5.0.0](https://github.com/Telefonica/mistica-ios/compare/v4.0.0...v5.0.0) (2020-11-19)


### Bug Fixes

* **Cocoapods:** Fix paths of source_files and resources ([85c3da1](https://github.com/Telefonica/mistica-ios/commit/85c3da17cb7becc7d342d31a4de47c608b9363e1))


### Features

* **Mistica:** Rise deployment target to iOS 12 ([#32](https://github.com/Telefonica/mistica-ios/issues/32)) ([703e21f](https://github.com/Telefonica/mistica-ios/commit/703e21f6654c0069a59d911190f0dd525e627eee))


### BREAKING CHANGES

* **Mistica:** iOS 11 has been deprecated.

# [4.0.0](https://github.com/Telefonica/mistica-ios/compare/v3.1.0...v4.0.0) (2020-11-11)


### Features

* **Button:** Remove min width in Button link ([9b711dd](https://github.com/Telefonica/mistica-ios/commit/9b711dd9eae6f5f8d76273ccb8646063933de30d))
* **Feedbacks:** Update MovistarES error feedback animation ([#27](https://github.com/Telefonica/mistica-ios/issues/27)) ([aab0d49](https://github.com/Telefonica/mistica-ios/commit/aab0d495ce99ee7ef887a1ff80ea3774f646d33a))


### BREAKING CHANGES

* **Button:** Button link won't have a min width anymore
* **Feedbacks:** The existing feedback animation will be replaced with this new version

# [3.1.0](https://github.com/Telefonica/mistica-ios/compare/v3.0.0...v3.1.0) (2020-11-04)


### Features

* **UINavigationBar:** Add UINavigationBar extension for provides styles based on the brand used. ([fe448ff](https://github.com/Telefonica/mistica-ios/commit/fe448ff89109216b136e24f298236cd103ce219b))

# [v3.0.0](https://github.com/Telefonica/mistica-ios/compare/v2.3.0...v3.0.0) (2020-10-28)

### Breaking Changes

* Delete MisticaCatalog library, migrate Mistica app to SwiftUI and apply new design for components list screen  ([c204a17](https://github.com/Telefonica/mistica-web/commit/c204a17ff21b5dd964566544a6d31ebe796280b4))

# [v2.3.0](https://github.com/Telefonica/mistica-ios/compare/v2.2.0...v2.3.0) (2020-10-20)

### Features

* **RadioButton:** new RadioButton component ([07cdcdf](https://github.com/Telefonica/mistica-web/commit/07cdcdf378fdc576e8fe08b15f9b5d135d182176))
* **CheckBox:** new CheckBox component. ([f8ac04d](https://github.com/Telefonica/mistica-web/commit/f8ac04de2545bae7d1dcdb5f7b1eb14fc9ca4721))
* **Switch:** new Switch component. ([d8e1e2f](https://github.com/Telefonica/mistica-web/commit/d8e1e2f55199bedae03fbb05399bd0e530d15379))
* **Development:** added header rule to SwiftFormat. ([58bac11](https://github.com/Telefonica/mistica-web/commit/58bac11ff6d4ae9c82c04940c0d7820b28e1fbef))

# [v2.2.0](https://github.com/Telefonica/mistica-ios/compare/v2.1.0...v2.2.0) (2020-10-07)

### Bug Fixes

* **Feedbacks:** show icons correctly in o2Classic brand ([5ba329b](https://github.com/Telefonica/mistica-web/commit/5ba329bb423a9e63285c03e2650bc0066d1e476f))
* **Croutons:** make the component can skip the safe area automatically. ([5ba329b](https://github.com/Telefonica/mistica-web/commit/5ba329bb423a9e63285c03e2650bc0066d1e476f))

# v.2.1.0 - 2020-09-29
- Update FontToolkit adding a parameter for constraining the preferred size of each text preset

# v.2.0.0 - 2020-09-17
- Update FontStyle with new text-presets

# v.1.3.5 - 2020-09-10

- Freeze enums in Mistica
- Fix loading button in MisitcaCatalog
- Allow showing a navigation bar in the MisticaCatalog landing view

# v.1.3.4 - 2020-09-08

- Add module stability and compatibility with Xcode 12.

# v.1.3.3 - 2020-09-08

- Play animation after finish retry async task.
- 
# v.1.3.2 - 2020-09-03

- Merge v1.1.2 branch

# v.1.3.1 - 2020-09-01

- Fix popover misalignment when the target view is next to the side and support adding the popover to scrollviews.

# v.1.3.0 - 2020-08-27

- Add new `retryButton` for `FeedbackView`

# v.1.2.0 - 2020-08-26

- Add `HighlightedCard` component.
- Add app icon to example app.

# v.1.1.2 - 2020-09-03

- Fix Movistar dark prominent color.

# v.1.1.1 - 2020-08-20

- Fix Movistar prominent colors.

# v.1.1.0 - 2020-08-17

- Add `accessibilityIdentifier` to `SegmentSelector` and `TagView`.
- Take advantage of updating SwiftFormat rules to avoid conflicts with SwiftFormat 0.45.6.

# v.1.0.2 - 2020-08-14

- Fix `O2ColorPalette`

# v.1.0.1 - 2020-08-11

- Update Vivo `bubbleOtherBackground` color.

# v.1.0.0 - 2020-08-07

- First release!