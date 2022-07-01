#  Lists

Lists are continous group of text with images and/or controls. We currently provide two classes `ListView.swift` and `ListViewCell.swift`.

Lists has two styles of cells `FullWidth`, `Boxed` and `BoxedInverse`

| FullWidth   |      Boxed      | Boxed Inverse |
|----------|:-------------:|:-------------:|
| <img src="./docs/images/lists-fullwidth.png" alt="drawing" width="300"/> |  <img src="./docs/images/lists-boxed.png" alt="drawing" width="300"/> |  <img src="./docs/images/lists-boxed-inverse.png" alt="drawing" width="300"/> |


#  ListViewCell

`ListViewCell` has the following anatomy

<p align="center">
  <img width="300" src="./docs/images/row-anatomy.png"/>
</p>

* **Section A** contains an asset, which can be configured with one of the following three styles:
	- **Small icon**: 24x24 icon.
	- **Large icon**: 24x24 icon centered on a circle with 40px diameter and a provided background color.
	- **Image**: an image cliped to a circle with 40px diameter.
* **Section B** contains the following elements (described form top to down)
	* A headline section which can be customized with any kind of `UIView`
	* Title: non optional
	* Subtitle: optional
	* Description: optional
* **Section C** can be configured with any kind of UIView.

## Usage

`ListView` inherit from `UITableView` so you should configure `ListView` as you usually configure a `UITableView`.

```swift
let listView = ListView()
listView.delegate = // set you delegate
listView.dataSource = // set you datasource
```

Then register the `ListViewCell.swift` on you recently created `ListView`

```swift
listView.register(ListViewCell.self, forCellReuseIdentifier: "ListViewCell")
```

### Configuring ListViewCell

You can use `ListViewCell.swift` component directly or inherit from him, a full configuration looks like

```swift
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	let cell = listView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell

	cell.title = "My title"
	cell.detailText = "My detail text"
	cell.assetType = .largeIcon(UIImage(named: "myAsset"), backgroundColor: .iconDisabled)
	cell.isCellSeparatorHidden = isLastCell(indexPath)

	return cell
}
```

#### Control Customization

`ListViewCell.swift` can be configured with a custom control like

```swift
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	let cell = listView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell

	...

	cell.controlView = myCustomControlView

	...

	return cell
}
```

The view asigned to `controlView` is added in a horizontal `UIStackView` with a fill distribution and the custom view is aligned to the top. The view will be stretched filling the available height space determined by the elements in the **Section B**.

We provide two presets custom controls.

* **VerticallyCenteredPresetView**, aligns the center of an arranged view with its center of the cell view.
* **NavigationPresetView**, a custom preset control for rows that navigate and need a badge view.

