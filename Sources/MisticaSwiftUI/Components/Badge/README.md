#  Badge

Badges are UI elements made up by a small red oval which may contain a white number. The number range goes from 1 to 9, for a number higher than 9 the text stays as "+9".  

## Usage

Create an instance of `Badge` with the style required.

```swift
let badgeView = Badge(style: .flag)
```

## Styles

Badges come in two styles. `Flag` and `Numeric`. If the style selected is `Numeric`, you can use the `value` variable to specify the badge value.
