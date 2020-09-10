# Contributing to mistica-ios

Thank you for your interest in Mística. You can contribute to this project in several ways:

Feel free to contact maintainers at the
[Mística Teams Channel](https://teams.microsoft.com/l/channel/19%3ad2e3607a32ec411b8bf492f43cd0fe0c%40thread.tacv2/General?groupId=e265fe99-929f-45d1-8154-699649674a40&tenantId=9744600e-3e04-492e-baa1-25ec245c6f10).
Don't hesitate to ask any questions and share your ideas

## Pull Requests

We would love to accept your Pull Requests but please, before starting your development,
[create an issue](https://github.com/Telefonica/mistica-ios/issues/new/choose).

## Bug reports

If something is broken or not working as expected, let us know!

:bug: [Open a Bug issue](https://github.com/Telefonica/mistica-ios/issues/new?assignees=&labels=bug&template=bug_report.md&title=)

## Feature requests (no UI/UX changes)

If you need additional functionality, support a new use case, improve a component API...

:construction: [Open a Feature Request issue](https://github.com/Telefonica/mistica-ios/issues/new?assignees=&labels=enhancement&template=feature-request.md&title=)

**Important:** Your feature request should not include UI or UX changes, only implementation details, because
those kind of changes must be evaluated, approved and documented by the `Design Core Team` (see
[New component proposals or UI/UX changes](#new-component-proposals-or-uiux-changes) section).

## Documentation and help requests

Is something in our documentation not well explained? Do you need help using a component? 

:blue_book: [Open an Documentation issue](https://github.com/Telefonica/mistica-ios/issues/new?assignees=&labels=documentation&template=documentation-request.md&title=)

## New component proposals or UI/UX changes

Adding a new component to the Mística Design System or updating the UI/UX of an existing one requires to
follow a process where the component and its use cases will be evaluated by the `Design Core Team`.

Share your ideas at the
[Mística Teams Channel](https://teams.microsoft.com/l/channel/19%3ad2e3607a32ec411b8bf492f43cd0fe0c%40thread.tacv2/General?groupId=e265fe99-929f-45d1-8154-699649674a40&tenantId=9744600e-3e04-492e-baa1-25ec245c6f10)
or [open an issue](https://github.com/Telefonica/mistica/issues) in the main Mistica Repository

## How to work with mistica-ios

To create or modify components from the Mistica library follow the next steps:

1. Clone this repo

2. Install SwiftFormat, if you already have installed Homebrew:

```sh
brew install swiftformat
```

or read the [documentation](https://github.com/nicklockwood/SwiftFormat#command-line-tool).

3. Use carthage to update Mistica's dependencies (Lottie) and be able to build locally:

> The Carthage version `0.35.0` does not work properly on Xcode 12 without a workaroud. Use the script `carthage-build.sh` to update and build dependencies.

```
./carthage-build.sh
```

For previous versions of Xcode you can still use:

```swift
carthage update --platform iOS
```

4. Open `Mistica.xcodeproj`

5. Place the new component under the `Components` folder. The component should have a proper definition by the design team.

When implementing the component, try to have in mind the following guidelines:

* The component should be implemented to be reusable. Make it generic enough so that other teams can also use it.
* Make sure the component reiszes correctly (we support iPad multitasking, so any screen can resize at any given time).
* Don't forget accessibility (VoiceOver, Dynamic Type...).
* Pay attention to user interaction (Gestures, Haptics, 3D Touch...)
* Although this should be transparent to you, take into account themes and multiple brands.
* To help other developers, add documentation about the new component.

> Future versions will include a sample app or catalog to test those components. Once the catalog is available, don't forget to include new components on it.
