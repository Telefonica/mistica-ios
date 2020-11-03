#  UINavigationBar

The UINavigationBar component will not be implmented because we promote the native UINavigationBar.

But Mistica provides styles for UINavigationBar based on the brand used. 

## Usage

Mistica provides an extension to `UINavigationBar` named `applyMisticaStyle`.

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.applyOpaqueStyle()
}
```
