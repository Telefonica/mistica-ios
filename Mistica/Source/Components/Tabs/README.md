#  Tabs
`TabsView` is used to render a scrollable selector that will typically be placed below the navigation bar, and which is used to let the user select one tab among a list of them. You will typically use these tabs to show content according to a subject. This component must have at least 2 items.

## Accessibility

Given that this component is designed to be placed below a navigation bar, the component opts out of Dynamic Type, and makes use of Large Content Viewer. This means that when the user selects an accessibility text size, the user can long press in the `TabsView` to show a HUD with the name of the categories, similarly to what happens in native toolbars.


This feature is available only on iOS 13, so unfortunately, previous versions won't have accessibility support for large content.

Finally, the component is optimized for VoiceOver.


## Usage

Create an instance of `TabsView` by providing a list of `TabItem`'s to be displayed.

```swift
let items = [
    TabItem(title: "tab 1", icon: UIImage(named: "icon 1")!),
    TabItem(title: "tab 2", icon: UIImage(named: "icon 2")!),
    TabItem(title: "tab 3", icon: UIImage(named: "icon 3")!)
]
let tabs = TabsView(tabItems: items)
```

You can reset the `items`  at your discretion. Every time you set this property, the tab items will automatically reload.

Set a delegate for the component if you want to be notified when an item is selected. 

```swift
func tabsView(_ tabsView: TabsView, didSelectTab tab: TabItem)
```
### Reload items

A new list of Items can be displayed, replacing the previous list of components. 

```swift
let dataset: [TabItem] = [
    TabItem(title: "Movistar Spain eSports 2021", icon: .tagsIcon),
    TabItem(title: "Movies", icon: .buttonsIcon)
] 
tabs.reload(with: dataset)
```

### Update item

From the current list, any item can be updated by changing the name or icon. It is only necessary to indicate the `TabItem` to change and indicate the new one. 

```swift
let newSelectedTabItem = TabItem(
    title: title,
    icon: icon
)
tabs.update(currentSelectedTabItems, newTabItem: newSelectedTabItem)
```

### Remove item

To delete an item, it is only necessary to indicate the corresponding `TabItem`. 

```swift
let itemIndexToRemove = 3
tabs.remove(itemIndexToRemove)
```

### Interface Builder

You can also embed  `TabsView` in a xib. Just put a plain UIView in your canvas and then in the Identity Editor tab, set  `TabsView` as the class name. Then you can create an outlet and add items in `viewDidLoad()` or wherever fits better your problem.

```swift
class ViewController: UIViewController {

    @IBOutlet var tabsView: TabsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tabsView.reload(with: [
            TabItem(title: "tab 1", icon: UIImage(named: "icon 1")!),
            TabItem(title: "tab 2", icon: UIImage(named: "icon 2")!),
            TabItem(title: "tab without icon")
        ])
    }
}
```


## Sizing

`TabsView` has a **fixed height** of 56 points. So keep this in mind when laying out this component. 

Width is also fixed to the width of the screen. TabItemViewCell's width will change according to the number of items. 

Cases:
    - 2 items: Tab width will be 50% of `TabsView` width. No matter long or short texts.
    - 3 items: The width of each Tabs will be distributed proportionally between each Tab, in this case 33%.
    - More items: `TabsView` will enable horizontal scroll. TabItemViewCell will have a maximum width constraint of 280 points.

