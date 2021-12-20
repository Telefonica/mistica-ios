# [14.2.0](https://github.com/Telefonica/mistica-ios/compare/v14.1.0...v14.2.0) (2021-12-20)


### Features

* **Xcode:** Supports Xcode 13.2 ([#149](https://github.com/Telefonica/mistica-ios/issues/149)) ([9ad19dc](https://github.com/Telefonica/mistica-ios/commit/9ad19dc803721f74fc495b9a115ecf5926c176cf))

# [14.1.0](https://github.com/Telefonica/mistica-ios/compare/v14.0.0...v14.1.0) (2021-12-03)


### Bug Fixes

* **EmptyState:** Missing accessibility ids on the Empty State - SMARTWIFI-3093 ([#148](https://github.com/Telefonica/mistica-ios/issues/148)) ([72d4f2b](https://github.com/Telefonica/mistica-ios/commit/72d4f2b43e4d6b93a9ec37dcb4764b0645b35122))


### Features

* **Feedback:** IOS-7129 ADD: Error Reference inside feedback component ([#144](https://github.com/Telefonica/mistica-ios/issues/144)) ([6da246c](https://github.com/Telefonica/mistica-ios/commit/6da246cdcdd3ab6d7d4fd017fa0d048be8751290))

# [14.0.0](https://github.com/Telefonica/mistica-ios/compare/v13.0.1...v14.0.0) (2021-10-19)


### Features

* **Blau Color Palette:** Update colors of Blau brand style ([81c01a9](https://github.com/Telefonica/mistica-ios/commit/81c01a9c0b34975251f621f489a35521b592a7b9))
* **Xcode 13 & Swift 5.5:** Add support for Xcode 13 and Swift 5.5 ([b6b0d12](https://github.com/Telefonica/mistica-ios/commit/b6b0d122a1d66194c075bc75acfb37a2f0fabe11))


### BREAKING CHANGES

* **Xcode 13 & Swift 5.5:** Now the library support Swift 5.5, it means that it not compatible with projects using previous versions.

## [13.0.1](https://github.com/Telefonica/mistica-ios/compare/v13.0.0...v13.0.1) (2021-09-28)


### Bug Fixes

* **EmptyState:** Do not show border in non card styled empty states ([#140](https://github.com/Telefonica/mistica-ios/issues/140)) ([6a741de](https://github.com/Telefonica/mistica-ios/commit/6a741de60681c3b5330493b2a037d5ea326fd7a8))

# [13.0.0](https://github.com/Telefonica/mistica-ios/compare/v12.0.0...v13.0.0) (2021-09-23)


### Features

* **Blau brand style:** Add new brand style: Blau ([19bae89](https://github.com/Telefonica/mistica-ios/commit/19bae895565088ff8707c0a1880f1d2771c9791b))


### BREAKING CHANGES

* **Blau brand style:** The enum BrandStyle has a new case: blau

# [12.0.0](https://github.com/Telefonica/mistica-ios/compare/v11.4.0...v12.0.0) (2021-09-16)


### Bug Fixes

* **EmptyState:** Controlador de estado vacío de botones IOS-7012 ([#137](https://github.com/Telefonica/mistica-ios/issues/137)) ([d14a4fd](https://github.com/Telefonica/mistica-ios/commit/d14a4fda11dc03d64ec39c7bcf8e902a1cbf79ae))


* refactor(SegmentSelector) Rename SegmentSelector to Filter (#136) ([6830ea9](https://github.com/Telefonica/mistica-ios/commit/6830ea9a15dd8a00eb61ab514f519d3f49a8df4a)), closes [#136](https://github.com/Telefonica/mistica-ios/issues/136)


### BREAKING CHANGES

* SegmentSelector as been renamed to Filter.

# [11.4.0](https://github.com/Telefonica/mistica-ios/compare/v11.3.0...v11.4.0) (2021-09-14)


### Bug Fixes

* **SegmentSelector:** Fix segment selection after theme changes ([#131](https://github.com/Telefonica/mistica-ios/issues/131)) ([27afa2e](https://github.com/Telefonica/mistica-ios/commit/27afa2eccd2c1bf3f60a0caa4dc88187836fcf86))


### Features

* **Callouts:** Callouts component. ([cea08de](https://github.com/Telefonica/mistica-ios/commit/cea08de4c91987119290ddf90124ea8b373f8afb))
* **EmptyState:** Empty state component. ([211eb4d](https://github.com/Telefonica/mistica-ios/commit/211eb4da3bd419623ac8c665fcf10c3b04d5c806))
* **Font:** Update font weights in Rowlist and Cards ([17dabdf](https://github.com/Telefonica/mistica-ios/commit/17dabdfdc05f4c3ca8fab91fd1180e31412571cd))

# [11.3.0](https://github.com/Telefonica/mistica-ios/compare/v11.2.0...v11.3.0) (2021-07-01)


### Features

* **Controls:** Update Checkbox and RadioButton animations ([#112](https://github.com/Telefonica/mistica-ios/issues/112)) ([ff570de](https://github.com/Telefonica/mistica-ios/commit/ff570dee9b8223ce25006d55ed6da71a236c40fe))

# [11.2.0](https://github.com/Telefonica/mistica-ios/compare/v11.1.2...v11.2.0) (2021-05-05)


### Bug Fixes

* **DarkMode:** Update neutralHigh and skeletonWave colors ([#113](https://github.com/Telefonica/mistica-ios/issues/113)) ([19397f1](https://github.com/Telefonica/mistica-ios/commit/19397f12e635f3464d807c446a5bbd2917033637))


### Features

* **Controls:** Make Checkbox Squared. ([#111](https://github.com/Telefonica/mistica-ios/issues/111)) ([77455e1](https://github.com/Telefonica/mistica-ios/commit/77455e1cea67b6cd97c2ee6f0b7877c8b2a41ca0))

## [11.1.2](https://github.com/Telefonica/mistica-ios/compare/v11.1.1...v11.1.2) (2021-04-28)


### Bug Fixes

* **DarkMode:** Fix dark mode colors in classic o2 ([#109](https://github.com/Telefonica/mistica-ios/issues/109)) ([7e6a7f6](https://github.com/Telefonica/mistica-ios/commit/7e6a7f69776419880a1f64ca250dc63a83723790))
* **DarkMode:** Update backgroundColor of ListViewCell ([#110](https://github.com/Telefonica/mistica-ios/issues/110)) ([91b22b2](https://github.com/Telefonica/mistica-ios/commit/91b22b232d8b4e54e53a4606f7a9af7ed6a27373))

## [11.1.1](https://github.com/Telefonica/mistica-ios/compare/v11.1.0...v11.1.1) (2021-04-22)


### Bug Fixes

* **Mistica:** IOS-6687 Updating lottie-ios version ([#106](https://github.com/Telefonica/mistica-ios/issues/106)) ([1ee1286](https://github.com/Telefonica/mistica-ios/commit/1ee128696bc839d6211d711d92040716aeb47af6))

# [11.1.0](https://github.com/Telefonica/mistica-ios/compare/v11.0.0...v11.1.0) (2021-04-21)


### Bug Fixes

* **DarkMode:** Update background color of Button ([a4b466e](https://github.com/Telefonica/mistica-ios/commit/a4b466e96d64d5076d02ecf2981291bd1a9992cb))
* **SectionTitle:** fix more than one line. Add snapshot test.  ([36a75c7](https://github.com/Telefonica/mistica-ios/commit/36a75c7b1a1ab76d9229d5c7dd7c6e8ff02a9a89))


### Features

* **Tabs:** Add tabs ([d1274c4](https://github.com/Telefonica/mistica-ios/commit/d1274c41dabe38eaf9cca573855fba8394238c15))

# [11.0.0](https://github.com/Telefonica/mistica-ios/compare/v10.0.0...v11.0.0) (2021-04-08)


### Features

* **DarkMode:** Components now support dark mode ([5a1eb8a](https://github.com/Telefonica/mistica-ios/commit/5a1eb8a7fa8f514fb3d71f214564c4e5927f5141))
* **FontStyle:** update font styles ([334c49a](https://github.com/Telefonica/mistica-ios/commit/334c49a77abd30288188d3b0492604f6efc4efef))


### BREAKING CHANGES

* **FontStyle:** Text preset nomenclature has been reversed from smallest to largest

# [10.0.0](https://github.com/Telefonica/mistica-ios/compare/v9.0.1...v10.0.0) (2021-03-10)


### Bug Fixes

* **Feedbacks:** Update Feedbacks handling of close and back buttons ([201d9b7](https://github.com/Telefonica/mistica-ios/commit/201d9b730e9611d013c20d9eb2cd34bfa8e89917))
* **SnapshotTests:** Update to iOS 14.4 / Xcode 12.4 ([d8d3af3](https://github.com/Telefonica/mistica-ios/commit/d8d3af3dfa13a9f44bfdba982b666ad463ccc001))


### Features

* **ColorPalette:** Update color palette ([0b79886](https://github.com/Telefonica/mistica-ios/commit/0b7988638615eb59a3c04493b594529a0dd8e2f3))


### BREAKING CHANGES

* **ColorPalette:** Some colors haven been renamed or removed
* **Feedbacks:** Feedback configuration API related to back/close button has changed

## [9.0.1](https://github.com/Telefonica/mistica-ios/compare/v9.0.0...v9.0.1) (2021-02-24)


### Bug Fixes

* **Accessibility:** improve Accessibility on Cards. Update Cards docs ([#86](https://github.com/Telefonica/mistica-ios/issues/86)) ([3bbe36b](https://github.com/Telefonica/mistica-ios/commit/3bbe36b64b8eb106a5d1ee868ed447eba6d15d21))

# [9.0.0](https://github.com/Telefonica/mistica-ios/compare/v8.0.1...v9.0.0) (2021-02-17)


### Bug Fixes

* **ColorPalette:** fix backgroundPromo color of O2ClassicColorPalette ([#75](https://github.com/Telefonica/mistica-ios/issues/75)) ([fd87da0](https://github.com/Telefonica/mistica-ios/commit/fd87da01c6e28677d85bdbc6bb46630d8788afc0))
* **DataCard:** fix border color of card ([cb4c3b0](https://github.com/Telefonica/mistica-ios/commit/cb4c3b01e9c4a5c23f7cdf19745caaa02764fdc1))
* **HighlightedCard:** add support for xib and storyboard ([5e3afa7](https://github.com/Telefonica/mistica-ios/commit/5e3afa73f9a2694422273359bfc58e35a83ebba2))
* **HighlightedCard:** fix showActionButton and showCloseButton so that the value of the variables makes sense in English ([b6a2921](https://github.com/Telefonica/mistica-ios/commit/b6a29216cd21a97adfbbf1de07a9dc41e68438b2))
* **HighlightedCard:** nake init with parameters: `(title:subtitle:rightImage:actionButtonStyle:)` configures the correct styles. ([31f2bf6](https://github.com/Telefonica/mistica-ios/commit/31f2bf63d205ef06253fede38138dc39850c19e8))
* **HighlightedCard:** set multi lines support for both texts (title and subtitle) ([#77](https://github.com/Telefonica/mistica-ios/issues/77)) ([657a3bc](https://github.com/Telefonica/mistica-ios/commit/657a3bc6343d2d40f87bde01404d2c97808b411f))
* **HighlightedCard,MediaCard,MediaCard,Stepper:** fix border color by replacing "divider" by "border" of the color palette and set the border size to 1 px ([66e4aae](https://github.com/Telefonica/mistica-ios/commit/66e4aae166f4efa17ab10651134a8e7465ad75d4))
* **MediaCard:** fix border color of card and vertical spacing after headline ([f62b6f2](https://github.com/Telefonica/mistica-ios/commit/f62b6f2afc01ac9b29e793de55b233c0abaf515a))
* **Stepper:**  Update Lottie stroke width ([#76](https://github.com/Telefonica/mistica-ios/issues/76)) ([0c9a35f](https://github.com/Telefonica/mistica-ios/commit/0c9a35f49806cf87c9a7ae1b487b106b61d96cb1))


### BREAKING CHANGES

* **HighlightedCard:** texts (title and subtitle) of HighlightedCard have no restrictions of number of lines and both add support multi lines.
* **Button:** Make Button a UIControl ([#79](https://github.com/Telefonica/mistica-ios/issues/79)) ([4b57222](https://github.com/Telefonica/mistica-ios/commit/4b5722211510b4bbed28f1b15a4596a28187972c))

## [8.0.1](https://github.com/Telefonica/mistica-ios/compare/v8.0.0...v8.0.1) (2021-01-28)


### Bug Fixes

* **HeaderView:** add support for setting custom accessibility IDs and labels ([#71](https://github.com/Telefonica/mistica-ios/issues/71)) ([97a98cd](https://github.com/Telefonica/mistica-ios/commit/97a98cd342e2a19069ca6afbe6ed07358f68ec22))
* **ListViewCell:** Add missing accessibility identifiers in ListViewCell ([#70](https://github.com/Telefonica/mistica-ios/issues/70)) ([33e1c8c](https://github.com/Telefonica/mistica-ios/commit/33e1c8cf66b5107eff24507d5a86aaf10cf16f27))

# [8.0.0](https://github.com/Telefonica/mistica-ios/compare/v7.1.0...v8.0.0) (2021-01-26)


### Bug Fixes

* **ListViewCell:** Rename ListCellView to ListViewCell ([#65](https://github.com/Telefonica/mistica-ios/issues/65)) ([ffba956](https://github.com/Telefonica/mistica-ios/commit/ffba9567437e31471fa2035393212b46a4143680))
* **Mistica:** Remove screenshots images from Mistica bundle ([f81c331](https://github.com/Telefonica/mistica-ios/commit/f81c3317502bc36e9bb1711e49c564e4b8920f7c))

### BREAKING CHANGES

* **ListViewCell:** Rename ListCellView to ListViewCell 
  
### Features

* **Cards:** new DatCard and MediaCard components ([163f388](https://github.com/Telefonica/mistica-ios/commit/163f388ce399a944e3b28ae67759ba02182c5f40))

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
