#  TitleView

`TitleView.swift` is used to separate sections within the same screen.

![cusomt](./docs/images/sectiontitle.png)

The title is always in uppercase.

## Usage

`TitleView.swift` inherit from `UITableViewHeaderFooterView` so you should configure `TitleView.swift` in a `UITableView` like this

```swift
tableView.register(TitleView.self, forHeaderFooterViewReuseIdentifier: "TitleView")
```

`TitleView.swift` supports self sizing so the `UITableView` must be configured like

```swift
tableView.sectionHeaderHeight = UITableView.automaticDimension
tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
```
and finally return the `TitleView.swift` like

```swift
override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
	let titleView = TitleView.dequeueReusableHeaderFooterView(withIdentifier: "TitleView")

    titleView.title = "My Section Title"

	return titleView
}
```
