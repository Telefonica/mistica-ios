# [35.6.0](https://github.com/Telefonica/mistica-ios/compare/v35.5.1...v35.6.0) (2025-09-11)


### Bug Fixes

* **XCode:** IOS-11775 Remove warnings using XCode 16.4 and update snapshot library ([#466](https://github.com/Telefonica/mistica-ios/issues/466)) ([1b026b7](https://github.com/Telefonica/mistica-ios/commit/1b026b7c6ebec704ada82013e76b77cf0f253f37))


### Features

* **Title:** update TitleView style to title3 in O2 ([#464](https://github.com/Telefonica/mistica-ios/issues/464)) ([7ef0150](https://github.com/Telefonica/mistica-ios/commit/7ef01504a84700c484fa48bf0de1a06d0902a842))

## [35.5.1](https://github.com/Telefonica/mistica-ios/compare/v35.5.0...v35.5.1) (2025-09-08)


### Bug Fixes

* **Callout:** Fix callout background for alternative ([#463](https://github.com/Telefonica/mistica-ios/issues/463)) ([b256d91](https://github.com/Telefonica/mistica-ios/commit/b256d918c170e30fc24aab5ed18d95bd90ac7022))
* **Snackbar:** Fix snackbar constraint when dismiss ([90d45e3](https://github.com/Telefonica/mistica-ios/commit/90d45e3f4886cbe2cd453d0017dfadc84e816281))

# [35.5.0](https://github.com/Telefonica/mistica-ios/compare/v35.4.3...v35.5.0) (2025-07-09)


### Features

* **Brands:** IOS-11577 remove old brands ([#459](https://github.com/Telefonica/mistica-ios/issues/459)) ([50a0033](https://github.com/Telefonica/mistica-ios/commit/50a003369e334e2222efbb785657624e33ff4e81))

## [35.4.3](https://github.com/Telefonica/mistica-ios/compare/v35.4.2...v35.4.3) (2025-07-03)


### Bug Fixes

* **Concurrency:** compilation problems with XCode 26 Beta 1 (part 2) ([fa671e2](https://github.com/Telefonica/mistica-ios/commit/fa671e2fca697c10b8745568eca081fb9f25b653))

## [35.4.2](https://github.com/Telefonica/mistica-ios/compare/v35.4.1...v35.4.2) (2025-07-03)


### Bug Fixes

* **Concurrency:** compilation problems with XCode 26 Beta 1 ([#453](https://github.com/Telefonica/mistica-ios/issues/453)) ([d943a73](https://github.com/Telefonica/mistica-ios/commit/d943a73b8d44a1d5485bf592b5c30aaa6a88928d))

## [35.4.1](https://github.com/Telefonica/mistica-ios/compare/v35.4.0...v35.4.1) (2025-06-30)


### Bug Fixes

* **FeedbackView:** make voiceOver be able to read title view first ([01f9225](https://github.com/Telefonica/mistica-ios/commit/01f9225c0e469aa3385f489e693c9f8a939f40b8))

# [35.4.0](https://github.com/Telefonica/mistica-ios/compare/v35.3.0...v35.4.0) (2025-06-24)


### Features

* **Feedback:** Adding the missing accessibilityTraits in header and buttons ([5cd82e5](https://github.com/Telefonica/mistica-ios/commit/5cd82e59f93c81f44e0dcd8067751a79c10b8ee0)), closes [#454](https://github.com/Telefonica/mistica-ios/issues/454)

# [35.3.0](https://github.com/Telefonica/mistica-ios/compare/v35.2.0...v35.3.0) (2025-06-12)


### Features

* **Snackbar:** add optional auto accessibility focus for persistent snackbars ([#452](https://github.com/Telefonica/mistica-ios/issues/452)) ([f43a55b](https://github.com/Telefonica/mistica-ios/commit/f43a55bacab46ffecc68faa2caed08d060e0312b))

# [35.2.0](https://github.com/Telefonica/mistica-ios/compare/v35.1.1...v35.2.0) (2025-05-28)


### Features

* **skin:** Improve color contrast in Blau skin ([#449](https://github.com/Telefonica/mistica-ios/issues/449)) ([f52d04f](https://github.com/Telefonica/mistica-ios/commit/f52d04f765d9707e1629724c4fffc9280504a7f6))
* **themeVariant:** Parsed new themeVariant token and apply it to success feedback views ([#450](https://github.com/Telefonica/mistica-ios/issues/450)) ([3d3f4a4](https://github.com/Telefonica/mistica-ios/commit/3d3f4a45441408b77e57b792542750fb753e7665))

## [35.1.1](https://github.com/Telefonica/mistica-ios/compare/v35.1.0...v35.1.1) (2025-05-07)


### Bug Fixes

* **Concurrency:** make SheetConfiguration and FeedbackConfiguration Sendable ([1e1941e](https://github.com/Telefonica/mistica-ios/commit/1e1941ee7dc0b4ae452a2d37041937024b6b88e7))

# [35.1.0](https://github.com/Telefonica/mistica-ios/compare/v35.0.1...v35.1.0) (2025-05-05)


### Features

* **Package:** Update lottie sdk to 4.5.1 ([#447](https://github.com/Telefonica/mistica-ios/issues/447)) ([1e5718c](https://github.com/Telefonica/mistica-ios/commit/1e5718c774a2d87d62153b5f3076c229c6c1d088))

## [35.0.1](https://github.com/Telefonica/mistica-ios/compare/v35.0.0...v35.0.1) (2025-04-23)


### Bug Fixes

* **Concurrency:** Fix Strict Concurrency in XCode 16.2 ([4d07d93](https://github.com/Telefonica/mistica-ios/commit/4d07d93fce0f520b731d4609c033e73a4dcfa3bd))

# [35.0.0](https://github.com/Telefonica/mistica-ios/compare/v34.0.0...v35.0.0) (2025-04-11)


### Features

* **Swift6:** Migration to Swift 6.0 with Strict Concurrency ([ad0e4da](https://github.com/Telefonica/mistica-ios/commit/ad0e4dadf9605eb0b7856d58c0d87f5d82426f52))


### BREAKING CHANGES

* **Swift6:** Package as well as the Mistica Catalog have been migrated to Swift 6 with the Strict concurrency check enabled. It is still compatible with projects still running on Swift 5.

# [34.0.0](https://github.com/Telefonica/mistica-ios/compare/v33.8.0...v34.0.0) (2025-03-19)


### Bug Fixes

* **semantic-release:** IOS-11147 Update node version as a dependency of the latest semantic-release version. ([#440](https://github.com/Telefonica/mistica-ios/issues/440)) ([17e4001](https://github.com/Telefonica/mistica-ios/commit/17e4001f6209fa1a6c42396eed42493cf1064843))
* **semantic-release:** IOS-11147 Update semantic release to v24.2.3 ([#438](https://github.com/Telefonica/mistica-ios/issues/438)) ([c632beb](https://github.com/Telefonica/mistica-ios/commit/c632beb62830f12e7876b3a5acedaac44343b1f2))
* **updateVersionScript:** IOS-11147 Fix the update version script to be compatible with Ubuntu sed version (GNU sed) instead of macOS sed (BSD sed). ([#442](https://github.com/Telefonica/mistica-ios/issues/442)) ([4609b69](https://github.com/Telefonica/mistica-ios/commit/4609b6960ee1768683089b50b8267b1396e0ee5c))
* **updateVersionScript:** IOS-11147 Update releasrc and update_version script to be executed in… ([#441](https://github.com/Telefonica/mistica-ios/issues/441)) ([414bc7e](https://github.com/Telefonica/mistica-ios/commit/414bc7e3f94eee6b38a855f93a8bf8c035a030a4))


### Features

* **Crouton:** IOS-11139 Remove crouton queue to avoid enqueuing messages. From now … ([#437](https://github.com/Telefonica/mistica-ios/issues/437)) ([827964b](https://github.com/Telefonica/mistica-ios/commit/827964b3f4b4114dd75d3c40c01899472e3bae95))
* **Snackbar:** Deprecate Crouton, introduce new Snackbar UI ([#422](https://github.com/Telefonica/mistica-ios/issues/422)) ([da64cea](https://github.com/Telefonica/mistica-ios/commit/da64cea1f037a999bd56e6ca1c143c0c360e66c9)), closes [#420](https://github.com/Telefonica/mistica-ios/issues/420) [#427](https://github.com/Telefonica/mistica-ios/issues/427) [#429](https://github.com/Telefonica/mistica-ios/issues/429)


### BREAKING CHANGES

* **Snackbar:** Renamed "Crouton" to "Snackbar". Updated UI for Snackbar component.

* IOS-9356 Adjust crouton constraints above the tabbar or the safe area

* IOS-9356 adjust crouton border radius and update close button size

* Run swiftformat
* **Crouton:** UIKit Crouton no longer allows message queuing. If a new crouton is presented, the previous one will be discarded. showCrouton and dismiss CroutonController methods have been modified to remove the token we used to dismiss a specific crouton.

* IOS-11139 Remove crouton queue to avoid enqueuing messages. From now if a new crouton is launched, the previous one will be removed.

* Run swiftformat

# [33.8.0](https://github.com/Telefonica/mistica-ios/compare/v33.7.0...v33.8.0) (2025-02-04)


### Features

* **skin:** update design tokens from mistica-design ([#425](https://github.com/Telefonica/mistica-ios/issues/425)) ([7a76235](https://github.com/Telefonica/mistica-ios/commit/7a76235b530fa664f4a6db31a7173625ad81bcb5))

# [33.7.0](https://github.com/Telefonica/mistica-ios/compare/v33.6.0...v33.7.0) (2024-12-16)


### Features

* **ViewStates:** added ViewStates component in SwiftUI ([c6da83a](https://github.com/Telefonica/mistica-ios/commit/c6da83a799a20d32dab06f66d112eae44fecb1e2))

# [33.6.0](https://github.com/Telefonica/mistica-ios/compare/v33.5.0...v33.6.0) (2024-12-16)


### Features

* **Forms:** added Forms component in SwiftUI ([3769e2c](https://github.com/Telefonica/mistica-ios/commit/3769e2c549e640f6824b01955dea9b568bf261e9))

# [33.5.0](https://github.com/Telefonica/mistica-ios/compare/v33.4.1...v33.5.0) (2024-12-16)


### Features

* **SnapCard:** LATCH-2380 Added SnapCard component ([#417](https://github.com/Telefonica/mistica-ios/issues/417)) ([25d22e9](https://github.com/Telefonica/mistica-ios/commit/25d22e97b3213c30a6634060469b34ef979ce174))

## [33.4.1](https://github.com/Telefonica/mistica-ios/compare/v33.4.0...v33.4.1) (2024-12-11)


### Bug Fixes

* **Feedback:** add safe concurrency in Feedback completion ([a6eea07](https://github.com/Telefonica/mistica-ios/commit/a6eea0775f63ff9884712b7836255f83fc30b764))

# [33.4.0](https://github.com/Telefonica/mistica-ios/compare/v33.3.0...v33.4.0) (2024-12-04)


### Features

* **Sheet:** IOS-10691 add separators to the sheet informative list ([d093f1f](https://github.com/Telefonica/mistica-ios/commit/d093f1f617242a911d1fb96868b5d8b261bbe279))

# [33.3.0](https://github.com/Telefonica/mistica-ios/compare/v33.2.1...v33.3.0) (2024-11-29)


### Features

* **PosterCard:** LATCH-2313 Poster card component ([#413](https://github.com/Telefonica/mistica-ios/issues/413)) ([0d2548a](https://github.com/Telefonica/mistica-ios/commit/0d2548a289aec41b5daa89f2428e156f7e70fc37))

## [33.2.1](https://github.com/Telefonica/mistica-ios/compare/v33.2.0...v33.2.1) (2024-11-12)


### Bug Fixes

* **Button:** Remove non necessary catalog example ([#411](https://github.com/Telefonica/mistica-ios/issues/411)) ([68092f7](https://github.com/Telefonica/mistica-ios/commit/68092f7f6813dccbdb47882e5b7605f49a7e14f7))

# [33.2.0](https://github.com/Telefonica/mistica-ios/compare/v33.1.0...v33.2.0) (2024-10-29)


### Bug Fixes

* **XCode16:** fix warnings in XCode 16 ([27adcbd](https://github.com/Telefonica/mistica-ios/commit/27adcbd6d2e6283b22b362ffcce04f7ecad9ac6c))


### Features

* **skin:** update design tokens from mistica-design ([#403](https://github.com/Telefonica/mistica-ios/issues/403)) ([e1ff58d](https://github.com/Telefonica/mistica-ios/commit/e1ff58dd60c3084236614216ae82c9dde1b3b709))
* **skin:** update design tokens from mistica-design ([#406](https://github.com/Telefonica/mistica-ios/issues/406)) ([2db45fb](https://github.com/Telefonica/mistica-ios/commit/2db45fb04c77ed3043397c36b529c66ab24da2ed))
* **skin:** update design tokens from mistica-design ([#407](https://github.com/Telefonica/mistica-ios/issues/407)) ([9db65b5](https://github.com/Telefonica/mistica-ios/commit/9db65b5ba79a64b8b2a647b3c26c1189690fa91f))

# [33.1.0](https://github.com/Telefonica/mistica-ios/compare/v33.0.0...v33.1.0) (2024-09-12)


### Features

* **Accessibility:** IOS-10448 [Mistica] RowList A11y update ([#399](https://github.com/Telefonica/mistica-ios/issues/399)) ([023b62c](https://github.com/Telefonica/mistica-ios/commit/023b62c4097a70c9388267264addd796dad88624))

# [33.0.0](https://github.com/Telefonica/mistica-ios/compare/v32.0.0...v33.0.0) (2024-08-26)


### Feat

* **Title:** Update title component and Mistica tokens ([#396](https://github.com/Telefonica/mistica-ios/issues/396)) ([d3df994](https://github.com/Telefonica/mistica-ios/commit/d3df994e732ac11151022c8aa7c8a4c74c6785eb)), closes [#397](https://github.com/Telefonica/mistica-ios/issues/397)


### BREAKING CHANGES

* **Title:** Add some title styles and modify the existing ones. Rename the color tokens from mistica-design.

* Update tokens

* Update tokens again

* Fix breaking change

# [32.0.0](https://github.com/Telefonica/mistica-ios/compare/v31.4.1...v32.0.0) (2024-08-19)


### Features

* **Title:** Split Title component and UIKit ([#395](https://github.com/Telefonica/mistica-ios/issues/395)) ([161ac6d](https://github.com/Telefonica/mistica-ios/commit/161ac6d6b50a2a0f98e9c4d068418aee445c4b00))


### BREAKING CHANGES

* **Title:** Rename TitleView with TitleHeaderFooterView. TitleHeaderFooterView will wrap the TitleView (Title component)

* Enable link interactions

* Extract Title component from TitleView (UITableViewHeaderFooterView)

* Rename and some fixes

* Rename tests path

* CR changes

## [31.4.1](https://github.com/Telefonica/mistica-ios/compare/v31.4.0...v31.4.1) (2024-08-01)


### Bug Fixes

* **Padding:** IOS-10430 fix component padding  ([#393](https://github.com/Telefonica/mistica-ios/issues/393)) ([8ddd7eb](https://github.com/Telefonica/mistica-ios/commit/8ddd7eb8550e976df25447b707f2d56fcec90adc))

# [31.4.0](https://github.com/Telefonica/mistica-ios/compare/v31.3.0...v31.4.0) (2024-07-26)


### Features

* **Crouton:** Allow to show crouton on a exact viewController ([e30d0bc](https://github.com/Telefonica/mistica-ios/commit/e30d0bc8643b5a8d95de6cc436bd7f0b854a0698))

# [31.3.0](https://github.com/Telefonica/mistica-ios/compare/v31.2.0...v31.3.0) (2024-07-23)


### Features

* **Skeletons:** added Mistica Skeletons components for SwiftUI and UIKit ([e99d295](https://github.com/Telefonica/mistica-ios/commit/e99d29539843b3aacada462645ef6a51b53badc0))

# [31.2.0](https://github.com/Telefonica/mistica-ios/compare/v31.1.0...v31.2.0) (2024-07-18)


### Features

* **Snackbar:** allow setting the accesibility identifier via SnackbarConfig ([#386](https://github.com/Telefonica/mistica-ios/issues/386)) ([4f1e08c](https://github.com/Telefonica/mistica-ios/commit/4f1e08c8cd4a401fb93e450c53cf2676ec83aa01))

# [31.1.0](https://github.com/Telefonica/mistica-ios/compare/v31.0.0...v31.1.0) (2024-07-15)


### Features

* **InputField:** add numeric style and option to set textContentType ([#385](https://github.com/Telefonica/mistica-ios/issues/385)) ([1db8499](https://github.com/Telefonica/mistica-ios/commit/1db84993111c9042f4c958521d69637edee72180))

# [31.0.0](https://github.com/Telefonica/mistica-ios/compare/v30.5.0...v31.0.0) (2024-07-12)


### Features

* **MisticaColors:** Update MisticaColors and VivoNew palette ([24a0a7c](https://github.com/Telefonica/mistica-ios/commit/24a0a7c217d3d0c8e11508235d5d5e8feb7ef708))


### BREAKING CHANGES

* **MisticaColors:** Refactor backgroundContainerBrand color token as MisticaColor

# [30.5.0](https://github.com/Telefonica/mistica-ios/compare/v30.4.0...v30.5.0) (2024-07-12)


### Bug Fixes

* **iOS14:** Upgrade package to iOS 14 and remove iOS 13 dependencies ([f8e6578](https://github.com/Telefonica/mistica-ios/commit/f8e6578f85ddfea1022653a0dc7c32a62e82588c))


### Features

* **Accesibility:** Set sheet title label accessibility trait to header ([#384](https://github.com/Telefonica/mistica-ios/issues/384)) ([72ade6d](https://github.com/Telefonica/mistica-ios/commit/72ade6d1219fd546673041b1af9486e51ecfe9d6))

# [30.4.0](https://github.com/Telefonica/mistica-ios/compare/v30.3.0...v30.4.0) (2024-06-27)


### Features

* **Accesibility:** Accesibility of Snackbars and croutons ([#375](https://github.com/Telefonica/mistica-ios/issues/375)) ([21bf939](https://github.com/Telefonica/mistica-ios/commit/21bf939a74f42bd57230359179a85fda86a1cc34))
* **Feedback:** Feedback icons for O2 new ([#374](https://github.com/Telefonica/mistica-ios/issues/374)) ([76ce0ce](https://github.com/Telefonica/mistica-ios/commit/76ce0cec281d8e39870e8db64ea9a611af28113f))

# [30.3.0](https://github.com/Telefonica/mistica-ios/compare/v30.2.0...v30.3.0) (2024-06-18)


### Features

* **Feedback:** LATCH-1676 Allowing 3 buttons at the same time: primary, secondary and link ([7a260f5](https://github.com/Telefonica/mistica-ios/commit/7a260f57d8e8f8e329f504f47155284e4d829dd4))

# [30.2.0](https://github.com/Telefonica/mistica-ios/compare/v30.1.1...v30.2.0) (2024-06-11)


### Features

* **Accesibility:** Update color tokens for accessibility ([c305146](https://github.com/Telefonica/mistica-ios/commit/c3051468b978a276d6c72e73c17a9b755f67e1f8))

## [30.1.1](https://github.com/Telefonica/mistica-ios/compare/v30.1.0...v30.1.1) (2024-06-06)


### Bug Fixes

* **Header:** Header does not display correctly in iOS 14 ([c0edf11](https://github.com/Telefonica/mistica-ios/commit/c0edf11968d4560cb12e8cccf913c0d9b44335fc))

# [30.1.0](https://github.com/Telefonica/mistica-ios/compare/v30.0.0...v30.1.0) (2024-06-04)


### Features

* **Row:** IOS-9929 Do not use the subtitle color for description label ([#371](https://github.com/Telefonica/mistica-ios/issues/371)) ([1cc1689](https://github.com/Telefonica/mistica-ios/commit/1cc16891b0ce5906e8f49dd9f0e7331fe55c4704))

# [30.0.0](https://github.com/Telefonica/mistica-ios/compare/v29.11.1...v30.0.0) (2024-05-09)


### Features

* **O2New:** Add new O2New brand ([6c8c194](https://github.com/Telefonica/mistica-ios/commit/6c8c194af8f1349781c277d83eda193307eb2325))


### BREAKING CHANGES

* **O2New:** Refactor backgroundBrand color token as MisticaColor new type

## [29.11.1](https://github.com/Telefonica/mistica-ios/compare/v29.11.0...v29.11.1) (2024-04-30)


### Bug Fixes

* **SVGImagesDownload:** Minor change to generate commit to fix previous commit ([#364](https://github.com/Telefonica/mistica-ios/issues/364)) semantic release typo ([#365](https://github.com/Telefonica/mistica-ios/issues/365)) ([b484da2](https://github.com/Telefonica/mistica-ios/commit/b484da22be429c9cdd6d62238ef4e0eaede82250))

# [29.11.0](https://github.com/Telefonica/mistica-ios/compare/v29.10.0...v29.11.0) (2024-04-29)


### Features

* **Accessibility:** IOS-9786 VIVO Novo app accessibility Assinaturas: decorative images/animation to ignore ([#362](https://github.com/Telefonica/mistica-ios/issues/362)) ([5325295](https://github.com/Telefonica/mistica-ios/commit/5325295ff18493824b95a1a6ec3723794ee1c638))

# [29.10.0](https://github.com/Telefonica/mistica-ios/compare/v29.9.0...v29.10.0) (2024-04-22)


### Features

* **Button:** Add link danger button ([#359](https://github.com/Telefonica/mistica-ios/issues/359)) ([4d63cac](https://github.com/Telefonica/mistica-ios/commit/4d63cace952d6b621473b182343b174b6708dced))

# [29.9.0](https://github.com/Telefonica/mistica-ios/compare/v29.8.0...v29.9.0) (2024-04-17)


### Bug Fixes

* **ColorTokenImporters:** Add type filter for color token importer ([af44945](https://github.com/Telefonica/mistica-ios/commit/af44945b6e5f441efcb2b12dcb0749c276bfe020))


### Features

* **Accessibility:** IOS-9797 VIVO Novo app accessibility: Titles in native content ([7fb989e](https://github.com/Telefonica/mistica-ios/commit/7fb989e0b9335f894092f3da2d4dbbff59611d95))

# [29.8.0](https://github.com/Telefonica/mistica-ios/compare/v29.7.4...v29.8.0) (2024-04-11)


### Features

* **Accessibility:** IOS-9794 VIVO Novo app accessibility: Bottom sheet formats ([#356](https://github.com/Telefonica/mistica-ios/issues/356)) ([1043989](https://github.com/Telefonica/mistica-ios/commit/104398990bbd1574b96e1559305e35c760592370))

## [29.7.4](https://github.com/Telefonica/mistica-ios/compare/v29.7.3...v29.7.4) (2024-04-10)


### Bug Fixes

* **Carousel:** Add missing inverse style option for the page bullets ([b6086f0](https://github.com/Telefonica/mistica-ios/commit/b6086f0d86db7a3bdf3fbd1ecfc85ca1b6b11f11))

## [29.7.3](https://github.com/Telefonica/mistica-ios/compare/v29.7.2...v29.7.3) (2024-04-04)


### Bug Fixes

* **StepView:** Fix stepper lottie animation in 4.4.1 version ([55d406c](https://github.com/Telefonica/mistica-ios/commit/55d406cd4ab903c8e737c0d42485dbb4bbe0a726))

## [29.7.2](https://github.com/Telefonica/mistica-ios/compare/v29.7.1...v29.7.2) (2024-04-04)


### Bug Fixes

* **Button:** wrong text color token in misticaLinkInverse button style ([#352](https://github.com/Telefonica/mistica-ios/issues/352)) ([a84a380](https://github.com/Telefonica/mistica-ios/commit/a84a380fa94b2fc0781e570c6f44a2da03992278))

## [29.7.1](https://github.com/Telefonica/mistica-ios/compare/v29.7.0...v29.7.1) (2024-04-03)


### Bug Fixes

* **Package:** Update Lottie SDK to 4.4.1 and SDWebImage to 5.19.1. Both with PrivacyManifest included. ([c6b80a2](https://github.com/Telefonica/mistica-ios/commit/c6b80a2fb4d7a5306d2a7585d7886deb517d0b17))

# [29.7.0](https://github.com/Telefonica/mistica-ios/compare/v29.6.3...v29.7.0) (2024-04-02)


### Features

* **Accessibility:** Add default ids for listCellContentView and fix callout component ids ([#348](https://github.com/Telefonica/mistica-ios/issues/348)) ([5aab0f2](https://github.com/Telefonica/mistica-ios/commit/5aab0f22b112ef3801f729f5687ff339447e32a9)), closes [#349](https://github.com/Telefonica/mistica-ios/issues/349) [#351](https://github.com/Telefonica/mistica-ios/issues/351) [#347](https://github.com/Telefonica/mistica-ios/issues/347) [#346](https://github.com/Telefonica/mistica-ios/issues/346)

# [29.6.0](https://github.com/Telefonica/mistica-ios/compare/v29.5.1...v29.6.0) (2024-03-19)


### Features

* **DataCard:** LATCH-1334 Now DataCard allows color customization ([#345](https://github.com/Telefonica/mistica-ios/issues/345)) ([49bdb8e](https://github.com/Telefonica/mistica-ios/commit/49bdb8e00c8797891fa9aa5012a86ea0fba79fa4))

## [29.5.1](https://github.com/Telefonica/mistica-ios/compare/v29.5.0...v29.5.1) (2024-03-13)


### Bug Fixes

* **Callout:** LATCH-1294 Improving Callout layout to give more room to … ([#344](https://github.com/Telefonica/mistica-ios/issues/344)) ([630c9c5](https://github.com/Telefonica/mistica-ios/commit/630c9c55594eff8810031ff042f763e819b3ed46))

# [29.5.0](https://github.com/Telefonica/mistica-ios/compare/v29.4.0...v29.5.0) (2024-03-05)


### Features

* **UIButton:** added extension for SVG images in URLs ([7942feb](https://github.com/Telefonica/mistica-ios/commit/7942feb15b8c57a100a12637f1cc333424ce0d8c))

# [29.4.0](https://github.com/Telefonica/mistica-ios/compare/v29.3.0...v29.4.0) (2024-02-29)


### Features

* **NewBrand:** add new Tu brand ([5ed7c7c](https://github.com/Telefonica/mistica-ios/commit/5ed7c7c73a47770f1c0efe3703a55deec9c16ad9))

# [29.3.0](https://github.com/Telefonica/mistica-ios/compare/v29.2.0...v29.3.0) (2024-02-21)


### Features

* **Callout:** IOS-9818 Adding inverse variant ([#337](https://github.com/Telefonica/mistica-ios/issues/337)) ([29dfe62](https://github.com/Telefonica/mistica-ios/commit/29dfe62f9504b07c0e7f3012e736e807904d178e))

# [29.2.0](https://github.com/Telefonica/mistica-ios/compare/v29.1.1...v29.2.0) (2024-02-06)


### Features

* **Sheet:** IOS-9663 Add accessibility to the background view ([#335](https://github.com/Telefonica/mistica-ios/issues/335)) ([7335c6d](https://github.com/Telefonica/mistica-ios/commit/7335c6db60954002d1a928045b86f6fd6707facf))

## [29.1.1](https://github.com/Telefonica/mistica-ios/compare/v29.1.0...v29.1.1) (2024-02-02)


### Bug Fixes

* **AccessibilityIdentifiers:** IOS-9694 - New struct for common Ids ([#334](https://github.com/Telefonica/mistica-ios/issues/334)) ([838aa6b](https://github.com/Telefonica/mistica-ios/commit/838aa6bd09ecd1f23a790f657d5872a2346ea0b0))
* **List:** Make list chevron accesibility identifier visible and configurable ([#333](https://github.com/Telefonica/mistica-ios/issues/333)) ([28967aa](https://github.com/Telefonica/mistica-ios/commit/28967aabccf1d01168c331eaf1912db9eb2df62a))

# [29.1.0](https://github.com/Telefonica/mistica-ios/compare/v29.0.0...v29.1.0) (2024-01-25)


### Features

* **skin:** IOS-9684 update design tokens from mistica-design branch: production ([#331](https://github.com/Telefonica/mistica-ios/issues/331)) ([7ba2e09](https://github.com/Telefonica/mistica-ios/commit/7ba2e097d1efc7b713077c305dba5b4470d71f4e))

# [29.0.0](https://github.com/Telefonica/mistica-ios/compare/v28.0.1...v29.0.0) (2024-01-25)


### Features

* **Crouton:** Fixed an error while the close button could not be presented with all the intervals supported ([94f42d2](https://github.com/Telefonica/mistica-ios/commit/94f42d2afec61c34116a7c54e183b438bf82d718))


### BREAKING CHANGES

* **Crouton:** Removed infiniteWithClose duration from SnackbarDismissInterval.

* IOS-9726 Fix close button with any duration

* Run swiftformat

## [28.0.1](https://github.com/Telefonica/mistica-ios/compare/v28.0.0...v28.0.1) (2024-01-16)


### Bug Fixes

* **TabsView:** Allows consumers to select an item and deselect all ([#328](https://github.com/Telefonica/mistica-ios/issues/328)) ([1191096](https://github.com/Telefonica/mistica-ios/commit/1191096b56a919e33980e4b7cf0f2ade8d323674))

# [28.0.0](https://github.com/Telefonica/mistica-ios/compare/v27.0.0...v28.0.0) (2024-01-09)


### Features

* **Image:** added parameter to custom size image row in UIKit ([269a8f2](https://github.com/Telefonica/mistica-ios/commit/269a8f2a4f4e1244fda4ad1c1f9a2d3a7fc2cf18))
* **List:** Add mising functionality to List ([5a81b74](https://github.com/Telefonica/mistica-ios/commit/5a81b74aba2dd54d388c809ce3eae4a107090184))
* **Snackbar:** Add Snackbar changes to the SwiftUI version ([74fce28](https://github.com/Telefonica/mistica-ios/commit/74fce28e939dbfa4895a6870a3a2b3af48da93a3))


### BREAKING CHANGES

* **List:** List asset .image has been renamed to .custom. This custom case has as parameter .image(UIImage) or .url(URL)

* https://jira.tid.es/browse/IOS-9421: Add support for url and image gesture
* **Snackbar:** Added changes to the public methods in CroutonController to make it easier to configure.

* IOS-9604 Added infinite interval to crouton and snackbar for the SwiftUI versions.

* IOS-9604 Fixed an error returning dismiss reason when should be timeout.

* Run swiftformat

* IOS-9604 Added a config to be deterministic when selecting a time interval with/without an action. Added the same config to the crouton version in UIKit.

* Run swiftformat

* IOS-9604 Fixed PR comments

# [27.0.0](https://github.com/Telefonica/mistica-ios/compare/v26.4.1...v27.0.0) (2023-11-10)


### Features

* **crouton:** Ios 9391 snackbar infinite actions ([#322](https://github.com/Telefonica/mistica-ios/issues/322)) ([888e0b4](https://github.com/Telefonica/mistica-ios/commit/888e0b41796455f323260c67805da6609e29a1b5))


### BREAKING CHANGES

* **crouton:** DismissHandlerBlock has changed and now has a CroutonControllerDismissReason as return parameter

* IOS-9391 Add infinite time interval to Crouton.

* Run swiftformat

* IOS-9391 Fix PR comments.

* Run swiftformat

* IOS-9441 Add a reason parameter to know why the crouton was dismissed.

* Run swiftformat

* IOS-9441 Remove consecutive case for now.

## [26.4.1](https://github.com/Telefonica/mistica-ios/compare/v26.4.0...v26.4.1) (2023-11-02)


### Bug Fixes

* **URL:** Fix URL extension to be internal instead of public to avoid possible collisions with other implementations ([9b4e0cc](https://github.com/Telefonica/mistica-ios/commit/9b4e0cc23ae6038a9d9d5a20be1b2c7cda7fab37)), closes [#321](https://github.com/Telefonica/mistica-ios/issues/321)

# [26.4.0](https://github.com/Telefonica/mistica-ios/compare/v26.3.0...v26.4.0) (2023-11-02)


### Bug Fixes

* **DataCard:** title, description or buttons could be empty ([#317](https://github.com/Telefonica/mistica-ios/issues/317)) ([de7a87a](https://github.com/Telefonica/mistica-ios/commit/de7a87ae3c2bcd523fd6a7946cbaf59fba623c31))
* **Header:** Setting a minimum height of 24px for rows in a Header ([f6463a3](https://github.com/Telefonica/mistica-ios/commit/f6463a339ed4592695e88ec7fa6310dbb0141416))
* **Tag:** update background color for inactive state ([#319](https://github.com/Telefonica/mistica-ios/issues/319)) ([d3b95b8](https://github.com/Telefonica/mistica-ios/commit/d3b95b85960c6615559fc336aef6edf9ea87b5e1))
* **URL:** Fix URL(string:) behavior on iOS 17 ([63b7d0b](https://github.com/Telefonica/mistica-ios/commit/63b7d0b6436d193b6e747b642301518462f7334c))


### Features

* **ListCellContentView:** Add public titleTextColorType property to be able to change the center section title color. ([d6a2dd9](https://github.com/Telefonica/mistica-ios/commit/d6a2dd992e9bbf75e8c3726b90e0e57793ed346e))

# [26.3.0](https://github.com/Telefonica/mistica-ios/compare/v26.2.0...v26.3.0) (2023-10-25)


### Features

* **FontStyle:** Wrong base sizes for presets 5, 9 and 10 [#311](https://github.com/Telefonica/mistica-ios/issues/311) ([1a6c183](https://github.com/Telefonica/mistica-ios/commit/1a6c183d7b0cb89143025c104f8a6be0de768a55))
* **Header:** added the Small style ([281be43](https://github.com/Telefonica/mistica-ios/commit/281be43e1d3ec2ef893d84ef609d5c686ba8a828))
* **skin:** update design tokens from mistica-design branch: production ([#313](https://github.com/Telefonica/mistica-ios/issues/313)) ([9bf2885](https://github.com/Telefonica/mistica-ios/commit/9bf28855ce65a9905c86b3fbc16758344af14bbe))

# [26.2.0](https://github.com/Telefonica/mistica-ios/compare/v26.1.0...v26.2.0) (2023-10-16)


### Bug Fixes

* **Button:** change colors for disabled style ([#308](https://github.com/Telefonica/mistica-ios/issues/308)) ([e829160](https://github.com/Telefonica/mistica-ios/commit/e8291606fb6bdf4dd6cba0c7e4596185ee4b564f))
* **Button:** change colors for disabled style ([#310](https://github.com/Telefonica/mistica-ios/issues/310)) ([fb108a1](https://github.com/Telefonica/mistica-ios/commit/fb108a1b893ec9f963284f073317424cbf0bff18))
* **Button:** Change cornerCurve from continuous to circular ([#307](https://github.com/Telefonica/mistica-ios/issues/307)) ([26a73b3](https://github.com/Telefonica/mistica-ios/commit/26a73b376a04969f8a673e40d3acebbfcf6c190f))
* **Snackbar:** change color for action button ([#304](https://github.com/Telefonica/mistica-ios/issues/304)) ([7054e3d](https://github.com/Telefonica/mistica-ios/commit/7054e3d688d415568e19d58d27576cc58b4ab789))
* **Tag:** change foreground and background colors according to specs ([#309](https://github.com/Telefonica/mistica-ios/issues/309)) ([6a9f441](https://github.com/Telefonica/mistica-ios/commit/6a9f44122460dd7cccea1b3f79a7bc79e51acad9))


### Features

* **Button:** Added accesibility to right image (chevron) ([05d77d9](https://github.com/Telefonica/mistica-ios/commit/05d77d9409ccb94d2def0ec32a9d2132537a5f5b))

# [26.1.0](https://github.com/Telefonica/mistica-ios/compare/v26.0.1...v26.1.0) (2023-09-25)


### Features

* **Feedback:** Update component ([9bfe335](https://github.com/Telefonica/mistica-ios/commit/9bfe33555a7b47c0bf27b636c32cdcdf242ae06a))

## [26.0.1](https://github.com/Telefonica/mistica-ios/compare/v26.0.0...v26.0.1) (2023-09-04)


### Bug Fixes

* **RadioButton:** IOS-9285 Fix radio button / check box colors ([#301](https://github.com/Telefonica/mistica-ios/issues/301)) ([ac18920](https://github.com/Telefonica/mistica-ios/commit/ac1892042e3fbd8290c7b84c6f63bada3e6ca78d))

# [26.0.0](https://github.com/Telefonica/mistica-ios/compare/v25.4.0...v26.0.0) (2023-08-31)


### Bug Fixes

* **BottomSheet:** Changed SVG coder ([#296](https://github.com/Telefonica/mistica-ios/issues/296)) ([4480d47](https://github.com/Telefonica/mistica-ios/commit/4480d47bf8ae47b4b90988813d49fd8946e7d8fc))
* **Checkbox:** set color for filling and rounded border ([#297](https://github.com/Telefonica/mistica-ios/issues/297)) ([076343d](https://github.com/Telefonica/mistica-ios/commit/076343d1d3dcd131d9ac6928766a6aba11d2e7f7))


* IOS-9146: BottomSheet actions (#299) ([e380ecc](https://github.com/Telefonica/mistica-ios/commit/e380ecc99bf5ad83e9f4765a9c3c562e8ea2249b)), closes [#299](https://github.com/Telefonica/mistica-ios/issues/299)


### Features

* **BottomSheet:** Added SVG image format support. ([#293](https://github.com/Telefonica/mistica-ios/issues/293)) ([fe71624](https://github.com/Telefonica/mistica-ios/commit/fe71624f5d32eeeee8ffb72828d9c25718f46226))
* **Button:** iOS-9080 button chevron ([977b1d9](https://github.com/Telefonica/mistica-ios/commit/977b1d993fb8bd34285731e6e9322e7d8d9e4331))


### BREAKING CHANGES

* Action type has been renamed as ActionList. To use the previous actions(items: [ActionItem]) rename the case in your project as actionList(items: [ActionListItem]). Also ActionItem has been renamed as ActionListItem.

# [25.4.0](https://github.com/Telefonica/mistica-ios/compare/v25.3.2...v25.4.0) (2023-07-24)


### Features

* **Fonts:** IOS-9162 Update token weights for native components ([#288](https://github.com/Telefonica/mistica-ios/issues/288)) ([c926e4a](https://github.com/Telefonica/mistica-ios/commit/c926e4a0ad9edc10b02d0dabb1ae8f6beaedfbc2))

## [25.3.2](https://github.com/Telefonica/mistica-ios/compare/v25.3.1...v25.3.2) (2023-07-19)


### Bug Fixes

* **Popover:** Popover improvements (align with figma specs) ([#291](https://github.com/Telefonica/mistica-ios/issues/291)) refs SMARTWIFI-7203 ([db1dfb0](https://github.com/Telefonica/mistica-ios/commit/db1dfb070c6b9f7eceb30f64fd8e9326982a06ed))

## [25.3.1](https://github.com/Telefonica/mistica-ios/compare/v25.3.0...v25.3.1) (2023-07-19)


### Bug Fixes

* **Bottom Sheet:** Fix component to expand horizontally ([#290](https://github.com/Telefonica/mistica-ios/issues/290)) ([266c5d8](https://github.com/Telefonica/mistica-ios/commit/266c5d8d190b79addb4ce6d82165b6284904098c))
* **InputField:** Avoid TextField auto expands horizontally ([#289](https://github.com/Telefonica/mistica-ios/issues/289)) ([c321d88](https://github.com/Telefonica/mistica-ios/commit/c321d8891b04c7e605033450710ec61a9ac1bbba))

# [25.3.0](https://github.com/Telefonica/mistica-ios/compare/v25.2.0...v25.3.0) (2023-06-29)


### Bug Fixes

* **cornerRadius:** Fix corner radius when the radius is calculated based on the view frame width/height ([d161eed](https://github.com/Telefonica/mistica-ios/commit/d161eed61ffc402880c1da7654c34a2518c30e43))


### Features

* **NewVivoTypographyTokenWeights:** IOS-8335 Added new typography token weights to support the new vivo typography. ([#286](https://github.com/Telefonica/mistica-ios/issues/286)) ([b5bf080](https://github.com/Telefonica/mistica-ios/commit/b5bf080189350fdba24beb963832a60c9f80aa24))

# [25.2.0](https://github.com/Telefonica/mistica-ios/compare/v25.1.0...v25.2.0) (2023-06-19)


### Features

* **ListCellContent:** Expose init ([#285](https://github.com/Telefonica/mistica-ios/issues/285)) ([15361ee](https://github.com/Telefonica/mistica-ios/commit/15361eea627395d14dab9f427b79dd82a516fe76))

# [25.1.0](https://github.com/Telefonica/mistica-ios/compare/v25.0.0...v25.1.0) (2023-06-08)


### Features

* **VivoNewSkin:** Add VivoNew skin. Updated all palettes for all brands. ([c2d1b78](https://github.com/Telefonica/mistica-ios/commit/c2d1b784005f6fe636e2325d64fe8d89ae0b7554))

# [25.0.0](https://github.com/Telefonica/mistica-ios/compare/v24.0.0...v25.0.0) (2023-05-30)


### chore

* **SPM:** IOS-9013 Combine mistica into a single package to prevent duplicated symbols when importing Mistica and MisticaSwiftUI ([#283](https://github.com/Telefonica/mistica-ios/issues/283)) ([10179e6](https://github.com/Telefonica/mistica-ios/commit/10179e628fc6094e535b51049f63ec1d6ac6174b))


### BREAKING CHANGES

* **SPM:** Mistica package now contains MisticaSwiftUI and Mistica for UIKit, imports of MisticaSwiftUI will need to be changed to import Mistica

# [24.0.0](https://github.com/Telefonica/mistica-ios/compare/v23.6.1...v24.0.0) (2023-05-26)


* IOS-8008 header evolution (#269) ([1ca5a6e](https://github.com/Telefonica/mistica-ios/commit/1ca5a6e991c3eea132f1a2f7a9e487e68de5d465)), closes [#269](https://github.com/Telefonica/mistica-ios/issues/269)


### BREAKING CHANGES

* Header evolution, the design has been updated and the way of indicating the properties of each element has been simplified. 

* IOS-8008 removed old Labels

* IOS-8008 removed old label from Header in catalog app

* IOS-8008 Updating the catalog viewcontroller according to the specs

* IOS-8008 add a Header SwiftUI version

* IOS-8008 add the Header SwiftUI version

* IOS-8008 add marging to Header view

* IOS-8008 add a HeaderStyle

* IOS-8008 add Style to header

* IOS-8008 configure view by setUpView method

* IOS-8008 remove HeaderView.Style enum

* IOS-8008 fix screenshot tests

* IOS-8008 add more screenshots

* IOS-8008 add SwiftUI Header screen-shot

* IOS-8008 fix right margen

* IOS-8008 changes from reviewers

* IOS-8008 simplify properties in Header

* IOS-8008 add lineLimit to Header SwiftUI control

* IOS-8008 add lineLimit to Header UIKit

* IOS-8008 Extract the HeaderText class

* IOS-8008 Moved HeaderViewStyle to MisticaCommon to simplify enums

* IOS-8008 To avoid a breaking change, I make the title and pretitle properties public

* IOS-8008 removed setup method and fix

## [23.6.1](https://github.com/Telefonica/mistica-ios/compare/v23.6.0...v23.6.1) (2023-05-23)


### Bug Fixes

* **HighlightedCard:** actionButton duplicated for accessibility tool ([#276](https://github.com/Telefonica/mistica-ios/issues/276)) ([3e2794c](https://github.com/Telefonica/mistica-ios/commit/3e2794c8b539033c62c0759c33833b974d6035af))

# [23.6.0](https://github.com/Telefonica/mistica-ios/compare/v23.5.0...v23.6.0) (2023-05-17)


### Features

* **MisticaTokens:** IOS-8300 added Mistica Tokens cornerRadius for every component. ([c3d569d](https://github.com/Telefonica/mistica-ios/commit/c3d569d7192b3a360b3aa421cfa67f9234211c4e))

# [23.5.0](https://github.com/Telefonica/mistica-ios/compare/v23.4.0...v23.5.0) (2023-05-05)


### Features

* **Feedback:** added a new feedback type with custom icon ([#273](https://github.com/Telefonica/mistica-ios/issues/273)) ([10ebf94](https://github.com/Telefonica/mistica-ios/commit/10ebf9488fae53d74c68edccf7bb641ace8c14bb))

# [23.4.0](https://github.com/Telefonica/mistica-ios/compare/v23.3.0...v23.4.0) (2023-05-04)


### Features

* **FontWeight:** Add FontWeights to the ".custom" brand ([#271](https://github.com/Telefonica/mistica-ios/issues/271)) ([85317ee](https://github.com/Telefonica/mistica-ios/commit/85317ee7412ff5a48f5d45ef299571cb456af01a))

# [23.3.0](https://github.com/Telefonica/mistica-ios/compare/v23.2.0...v23.3.0) (2023-04-25)


### Features

* **Colors:** Update textSecondaryInverse for all brands ([ac37ba6](https://github.com/Telefonica/mistica-ios/commit/ac37ba619849226157f531eab9b90214043eb272))

# [23.2.0](https://github.com/Telefonica/mistica-ios/compare/v23.1.0...v23.2.0) (2023-04-18)


### Features

* **FontWeight:** Added brandeable FontWeights ([d4280c2](https://github.com/Telefonica/mistica-ios/commit/d4280c24f4af605aa788c3a7f8390ea0a180f81d))

# [23.1.0](https://github.com/Telefonica/mistica-ios/compare/v23.0.2...v23.1.0) (2023-04-13)


### Features

* **TitleView:** IOS-8290 default title style based on the brand ([#268](https://github.com/Telefonica/mistica-ios/issues/268)) ([7d3a347](https://github.com/Telefonica/mistica-ios/commit/7d3a347cf46bd57510f23172e8c40a38f72c801e))

## [23.0.2](https://github.com/Telefonica/mistica-ios/compare/v23.0.1...v23.0.2) (2023-03-21)


### Bug Fixes

* **Tabs:** change the font colour and icon of the selected tab from the one that is not ([d8d27b4](https://github.com/Telefonica/mistica-ios/commit/d8d27b42cc7be18288d881e5a7ceddbd8a4cf2ca))

## [23.0.1](https://github.com/Telefonica/mistica-ios/compare/v23.0.0...v23.0.1) (2023-03-17)


### Bug Fixes

* **Brand:** IOS-8206 Updated Movistar color palette with the latest changes. ([#265](https://github.com/Telefonica/mistica-ios/issues/265)) ([09945a8](https://github.com/Telefonica/mistica-ios/commit/09945a8cc81c26e3730ef5084ef39241ac41690a))

# [23.0.0](https://github.com/Telefonica/mistica-ios/compare/v22.1.0...v23.0.0) (2023-03-16)


### Bug Fixes

* **Fonts:** IOS-8196 Fix font weights ([#262](https://github.com/Telefonica/mistica-ios/issues/262)) ([3948321](https://github.com/Telefonica/mistica-ios/commit/394832199db476cfbb8af5c5ada00a9cf74e6e0c))


### Features

* **Brand:** New moves brand and remove prominent ([016ad74](https://github.com/Telefonica/mistica-ios/commit/016ad74d501140bc21118feca54a3294e6077b5c))


### BREAKING CHANGES

* **Brand:** Renamed some tokens from the color palettes and removed prominent variant theme and all the code related with ThemeVariant

* IOS-7865 Update movistar mistica color palette for digital hub. Removed/renamed some tokens from MisticaColors protocol. Removed GradientView cause now is not used anymore.

* Run swiftformat

* IOS-7865 Removed O2Classic snapshots.

* IOS-7865 Added new snapshots for the new Movistar color palette.

* IOS-7865 Update ColorToolkit+UIColor with some tokens renamed.

* IOS-8052 Removed all code related with theme variants and prominent.

* Run swiftformat

# [22.1.0](https://github.com/Telefonica/mistica-ios/compare/v22.0.1...v22.1.0) (2023-03-15)


### Features

* **FontStyle:** added a new font style for DataCard titles ([1e490f4](https://github.com/Telefonica/mistica-ios/commit/1e490f4197e265db858b8fb5b7a8bb4d6c2c913a))

## [22.0.1](https://github.com/Telefonica/mistica-ios/compare/v22.0.0...v22.0.1) (2023-03-09)


### Bug Fixes

* **DataCard:** Fix DataCard UI with respect to the latest design requirements. ([b78e0b1](https://github.com/Telefonica/mistica-ios/commit/b78e0b15264092cd1019d44be23e12dcf2a01282))
* **ListCellContent:** Rename registered ListViewCells in Catalog ([a05cb94](https://github.com/Telefonica/mistica-ios/commit/a05cb9495ce88b1251c27e02181076e3d43179f9))

# [22.0.0](https://github.com/Telefonica/mistica-ios/compare/v21.1.0...v22.0.0) (2023-03-03)


### Bug Fixes

* **DataCard:** fix compilation error with Xcode 14.3 beta 2 ([e26751b](https://github.com/Telefonica/mistica-ios/commit/e26751b3d8081ae65617f86734b85df1b2715589))


### BREAKING CHANGES

* **DataCard:** removes use of optional binding where it's not needed

# [21.1.0](https://github.com/Telefonica/mistica-ios/compare/v21.0.0...v21.1.0) (2023-03-03)


### Features

* **Tag:** add optional icon to the left of tag text ([0a7f255](https://github.com/Telefonica/mistica-ios/commit/0a7f255aa3e4cbcc3c54c6bb5ef4c419e19c2b1d))

# [21.0.0](https://github.com/Telefonica/mistica-ios/compare/v20.2.0...v21.0.0) (2023-03-02)


### Features

* **ListViewCell:** Refactor ListViewCell as independent view for TableView and CollectionView ([4a8704b](https://github.com/Telefonica/mistica-ios/commit/4a8704bd9f4a33e2211b4ca1f8568981f70bae70))


### Reverts

* Revert "LATCH-335 Update component Tag with icon (#249)" (#251) ([516e316](https://github.com/Telefonica/mistica-ios/commit/516e316e32fdf2ad76bc31853b384ac4733d843f)), closes [#249](https://github.com/Telefonica/mistica-ios/issues/249) [#251](https://github.com/Telefonica/mistica-ios/issues/251)


### BREAKING CHANGES

* **ListViewCell:** ListViewCell has been independently refactored as a UIView. What we used to use as ListViewCell is now ListTableViewCell for ListTableViews. It has also been exposed as ListCollectionViewCell for CollectionViews.

# [20.2.0](https://github.com/Telefonica/mistica-ios/compare/v20.1.1...v20.2.0) (2023-02-10)


### Features

* **XCode:** Update to XCode 14.2 ([#245](https://github.com/Telefonica/mistica-ios/issues/245)) ([3d464cd](https://github.com/Telefonica/mistica-ios/commit/3d464cd7b0257cc8933dbb6c398fce9172d2ffd0))

## [20.1.1](https://github.com/Telefonica/mistica-ios/compare/v20.1.0...v20.1.1) (2023-02-10)


### Bug Fixes

* **MisticaColors:** Fix brand color for dark mode in MovistarColorPalette ([5635d89](https://github.com/Telefonica/mistica-ios/commit/5635d89f50e05697296e13855767b65d154ae744))
* **semantic-release:** Update Node to latest version available ([ca5cd24](https://github.com/Telefonica/mistica-ios/commit/ca5cd24f57ce77eb9868e94a55b1143b666ad788))

# [20.1.0](https://github.com/Telefonica/mistica-ios/compare/v20.0.0...v20.1.0) (2023-01-11)


### Bug Fixes

* **semantic-release:** Fix version to 20.0.2 ([9c5bb6f](https://github.com/Telefonica/mistica-ios/commit/9c5bb6f9a7aa44c02fedfce51560ffd00c976486))
* **semantic-release:** Move version specification to semantic-release package argument ([bbc5e23](https://github.com/Telefonica/mistica-ios/commit/bbc5e2353dd6275b37162dabdfa2d6534b4bb614))


### Features

* **Accessibility:** Allow TagView's label accessibility identifier edition and default accessibility identifier of FeedbackView ([0e21390](https://github.com/Telefonica/mistica-ios/commit/0e21390956165197b7927c394e7fdb2879aebb5f))

# [20.0.0](https://github.com/Telefonica/mistica-ios/compare/v19.1.0...v20.0.0) (2022-12-30)


### Bug Fixes

* **FontToolKit:** Font size calculus algorithm improvements  ([#237](https://github.com/Telefonica/mistica-ios/issues/237)) ([98b2663](https://github.com/Telefonica/mistica-ios/commit/98b266378cc1422110044601e14d1ff1ca22fa7c))


### BREAKING CHANGES

* **FontToolKit:** Now Mistica uses UIFontMetricts for calculating the font size based on the dynamic type selected by the user. It must work as before but we can found some differences.

# [19.1.0](https://github.com/Telefonica/mistica-ios/compare/v19.0.0...v19.1.0) (2022-11-23)


### Features

* **Crouton:** Added the option to customize the time to dismissed the Crouton (UIKit)([#231](https://github.com/Telefonica/mistica-ios/issues/231)) ([94195ca](https://github.com/Telefonica/mistica-ios/commit/94195ca43540e73091de8ecf74a6525541f2b966))

# [19.0.0](https://github.com/Telefonica/mistica-ios/compare/v18.3.1...v19.0.0) (2022-11-17)


### Bug Fixes

* **Sheet:** improvements and ui fixes. ([864e1d4](https://github.com/Telefonica/mistica-ios/commit/864e1d4d4cc0efde8b7c5bdce7a46dcd9b25e9d1))


### BREAKING CHANGES

* **Sheet:** The API of Sheet component is simpler, now is not needed to change the presentation as style as it is not needed to pass a transition delegate.

## [18.3.1](https://github.com/Telefonica/mistica-ios/compare/v18.3.0...v18.3.1) (2022-11-16)


### Bug Fixes

* **LegacyTextFieldCoordinator:** Fixing focus ([#230](https://github.com/Telefonica/mistica-ios/issues/230)) ([d419ed9](https://github.com/Telefonica/mistica-ios/commit/d419ed9698bf64c762fd122d8bf1fef02c1d0c93))

# [18.3.0](https://github.com/Telefonica/mistica-ios/compare/v18.2.4...v18.3.0) (2022-10-21)


### Features

* **Sheet:** Implement Sheet v2 (informative and action styles) ([08581b1](https://github.com/Telefonica/mistica-ios/commit/08581b198aa1d2371102da608ed9bdf760b26174))

## [18.2.4](https://github.com/Telefonica/mistica-ios/compare/v18.2.3...v18.2.4) (2022-10-11)


### Bug Fixes

* **Sheet:** Fix dismissal bug and TestUI in Sheet ([427d1dd](https://github.com/Telefonica/mistica-ios/commit/427d1dd1e5b5b8cb147fcf03dbecb6cc40349348))

## [18.2.3](https://github.com/Telefonica/mistica-ios/compare/v18.2.2...v18.2.3) (2022-09-27)


### Bug Fixes

* **Sheet:** IOS-7725 Load icons asynchronously ([#221](https://github.com/Telefonica/mistica-ios/issues/221)) ([f167058](https://github.com/Telefonica/mistica-ios/commit/f16705828e2c2c064ae0f8c60db67cd8a577ae07))

## [18.2.2](https://github.com/Telefonica/mistica-ios/compare/v18.2.1...v18.2.2) (2022-09-23)


### Bug Fixes

* **Sheet:** IOS-7720 Fix asset size ([5b957c7](https://github.com/Telefonica/mistica-ios/commit/5b957c781929f3a0eeae1f1c3a6177c71fcf5d03))

## [18.2.1](https://github.com/Telefonica/mistica-ios/compare/v18.2.0...v18.2.1) (2022-09-22)


### Bug Fixes

* **Accesibility:** Fix infinite loop in accesibility modifiers (SwiftUI) ([1274626](https://github.com/Telefonica/mistica-ios/commit/127462611b79e7ffd860441fcd63eec419786537))

# [18.2.0](https://github.com/Telefonica/mistica-ios/compare/v18.1.0...v18.2.0) (2022-09-21)


### Features

* **Sheet:** Add dark mode support in icon rows ([b475f2d](https://github.com/Telefonica/mistica-ios/commit/b475f2d859092fb886794323c8989b1b6e7fb5fa))

# [18.1.0](https://github.com/Telefonica/mistica-ios/compare/v18.0.1...v18.1.0) (2022-09-16)


### Features

* **BottomSheet:** IOS-7624 Add BottomSheet component ([4e28ce1](https://github.com/Telefonica/mistica-ios/commit/4e28ce1c60303640ff2ce7faac37c14df4b35ddf))

## [18.0.1](https://github.com/Telefonica/mistica-ios/compare/v18.0.0...v18.0.1) (2022-08-31)


### Bug Fixes

* **Assets:** IOS-7644 Exclude common assets from  protocol ([#211](https://github.com/Telefonica/mistica-ios/issues/211)) ([e664ecc](https://github.com/Telefonica/mistica-ios/commit/e664ecca0897a323af1652c647287e177e216c1e))
* **SwiftUI:** Fix navigation bar back tint color for iOS 16 ([7eca013](https://github.com/Telefonica/mistica-ios/commit/7eca013d1aecbb7c3542c5260bc8e4d318b22693))
* **Version:** Fix mistica version and catalog version ([#209](https://github.com/Telefonica/mistica-ios/issues/209)) ([a3aaffa](https://github.com/Telefonica/mistica-ios/commit/a3aaffaaead1c78f2a3ee1ee0e8dfc78373f74d5))

# [18.0.0](https://github.com/Telefonica/mistica-ios/compare/v17.1.0...v18.0.0) (2022-08-11)


### Code Refactoring

* **Colors:** Update Color Palette definition. ([#206](https://github.com/Telefonica/mistica-ios/issues/206)) ([f433140](https://github.com/Telefonica/mistica-ios/commit/f4331403faf3642d71f46453a0d25bdcee5d902c))


### Features

* **SwiftUI:** Support Mistica in SwiftUI ([#200](https://github.com/Telefonica/mistica-ios/issues/200)) ([b2689ef](https://github.com/Telefonica/mistica-ios/commit/b2689ef7dc64b259aa9706b6110e8161c4456724))


### BREAKING CHANGES

* **Colors:** Color palette properties are no longer static variabales.
* **SwiftUI:** Custom brands are now supported.

# [17.1.0](https://github.com/Telefonica/mistica-ios/compare/v17.0.1...v17.1.0) (2022-08-01)


### Bug Fixes

* **Prominent:** Fix prominent theme colors for Movistar ([#199](https://github.com/Telefonica/mistica-ios/issues/199)) ([7c74ba6](https://github.com/Telefonica/mistica-ios/commit/7c74ba666aa0f13999e4cb018634c1188c4fbbe4))


### Features

* **Logo:** changed new Mística logo ([c97e7ce](https://github.com/Telefonica/mistica-ios/commit/c97e7cedff332fdffffef74ab85fd57ee6cd73c6))

## [17.0.1](https://github.com/Telefonica/mistica-ios/compare/v17.0.0...v17.0.1) (2022-07-20)


### Bug Fixes

* **TitleView:** Make TitleView and TitleViewTest public adding them i… ([#195](https://github.com/Telefonica/mistica-ios/issues/195)) ([ff70de4](https://github.com/Telefonica/mistica-ios/commit/ff70de4d36f61a6c85dffc641609b64cfe9de2e0))

# [17.0.0](https://github.com/Telefonica/mistica-ios/compare/v16.0.0...v17.0.0) (2022-07-18)


### Features

* **MisticaEvolution:** Update corner radios, textPreset, Title component and colors.  ([#193](https://github.com/Telefonica/mistica-ios/issues/193)) ([2dd4c9c](https://github.com/Telefonica/mistica-ios/commit/2dd4c9cac869f0565a7db51b717b61079ca0889d))


### BREAKING CHANGES

* **MisticaEvolution:** Text presets from 5 to 10 does not need to receive weight.

# [16.0.0](https://github.com/Telefonica/mistica-ios/compare/v15.2.1...v16.0.0) (2022-05-30)


### Bug Fixes

* **RadioButton:** Accesibility traits ([#170](https://github.com/Telefonica/mistica-ios/issues/170)) ([447a167](https://github.com/Telefonica/mistica-ios/commit/447a1672c347a7a7ecb739301b2080d8bc698f1b))


* IOS-7087 Remove logic in error and info feedback screen in asset in vivo (#183) ([a538277](https://github.com/Telefonica/mistica-ios/commit/a53827728d4eeb4ac826fbba3164b92158847880)), closes [#183](https://github.com/Telefonica/mistica-ios/issues/183)


### Features

* **Colors:** Update colors to match web and Android ([#166](https://github.com/Telefonica/mistica-ios/issues/166)) ([03341d3](https://github.com/Telefonica/mistica-ios/commit/03341d31fa52b1abe851f64dc7b7889611868f5f))


### BREAKING CHANGES

* Update colors to match web and Android
fix(feedback): add an icon in the information feedback screen

* IOS-7087 add icnNotificationInfo to Vivo brand

* IOS-7087 fix snapshots tests

* IOS-7087 add mac-provisioning github action to test

* IOS-7087 add github-actions

* IOS-7087 unnecessary tasks eliminated

* IOS-7087 run fastlane setup after mac-provisioning task

* IOS-7087 run fastlane setup after mac-provisioning task

## [15.2.1](https://github.com/Telefonica/mistica-ios/compare/v15.2.0...v15.2.1) (2022-02-23)


### Bug Fixes

* **Tags:** IOS-7304 Tags won´t capitalize its text anymore ([#165](https://github.com/Telefonica/mistica-ios/issues/165)) ([b6a102d](https://github.com/Telefonica/mistica-ios/commit/b6a102d87484315e008276acd3c08278a47a3228))

# [15.2.0](https://github.com/Telefonica/mistica-ios/compare/v15.1.0...v15.2.0) (2022-02-15)


### Bug Fixes

* **EmptyState:** Missing accesiblity IDS in Empty state. Fix wrong color on InputField borders - SMARTWIFI-3416 ([#161](https://github.com/Telefonica/mistica-ios/issues/161)) ([4c61058](https://github.com/Telefonica/mistica-ios/commit/4c610582c606af26f63f1eecf0dd2e5bacb6d417))


### Features

* **Feedback:** IOS-7228 Updating feedback success/error lottie animations ([#164](https://github.com/Telefonica/mistica-ios/issues/164)) ([bb378eb](https://github.com/Telefonica/mistica-ios/commit/bb378ebc79679c353fd3cd675535175701ee73d6))

# [15.1.0](https://github.com/Telefonica/mistica-ios/compare/v15.0.1...v15.1.0) (2022-01-25)


### Features

* **Feedback:** Add error animation for feedback view for vivo IOS-7087 ([#159](https://github.com/Telefonica/mistica-ios/issues/159)) ([3c85ab8](https://github.com/Telefonica/mistica-ios/commit/3c85ab89de6b672c8a18dca5a4643bf1f886f1e4))

## [15.0.1](https://github.com/Telefonica/mistica-ios/compare/v15.0.0...v15.0.1) (2022-01-21)


### Bug Fixes

* **Tags:** Fix tag background colors on dark mode - IOS-7221 ([#157](https://github.com/Telefonica/mistica-ios/issues/157)) ([3406dc2](https://github.com/Telefonica/mistica-ios/commit/3406dc241ab3438edce43fa203633b9f29bd017d))

# [15.0.0](https://github.com/Telefonica/mistica-ios/compare/v14.2.0...v15.0.0) (2022-01-05)


### Features

* **Tag:** IOS-7115 Tags evolution ([#150](https://github.com/Telefonica/mistica-ios/issues/150)) ([3ef6d49](https://github.com/Telefonica/mistica-ios/commit/3ef6d496fec931fb3ff17b469e78ce32d6d21214))


### BREAKING CHANGES

* **Tag:** The existing Tag component has changed in many ways: size, color, font and icon support.

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
