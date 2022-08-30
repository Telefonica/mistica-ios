#  Tabs
`TabsView` is used to render a scrollable selector that will typically be placed below the navigation bar, and which is used to let the user select one tab among a list of them. You will typically use these tabs to show content according to a subject. This component must have at least 2 items.

## Accessibility

Given that this component is designed to be placed below a navigation bar, the component opts out of Dynamic Type, and makes use of Large Content Viewer. This means that when the user selects an accessibility text size, the user can long press in the `TabsView` to show a HUD with the name of the categories, similarly to what happens in native toolbars.


This feature is available only on iOS 13, so unfortunately, previous versions won't have accessibility support for large content.

Finally, the component is optimized for VoiceOver.


## Usage

Create an instance of `Tabs` by providing a list of `TabItem`'s to be displayed.

```swift
let items = [
    TabItem(text: "tab 1", image: Image(named: "icon 1")),
    TabItem(text: "tab 2", image: Image(named: "icon 2")),
    TabItem(text: "tab 3", image: Image(named: "icon 3"))
]
Tabs(tabItems: items, selection $selection)
```

## Sizing

`TabsView` has a **fixed height** of 56 points. So keep this in mind when laying out this component. 

Cases:
    - 2 items: Tab width will be 50% of `Tabs` width. No matter long or short texts.
    - 3 items: The width of each Tabs will be distributed proportionally between each Tab, in this case 33%.
    - More items: `TabsV` will enable horizontal scroll. Each tab will have a maximum width constraint of 280 points.

