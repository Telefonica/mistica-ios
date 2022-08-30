#  UINavigationBar

Mística doesn't provide a custom navigation bar component. Instead, it recommends the usage of the native `UINavigationBar` and provides styles based on the brand used.

## Usage

Mística provides an extension to `UINavigationBar` named `applyMisticaStyle`.

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.applyOpaqueStyle()
}
```
