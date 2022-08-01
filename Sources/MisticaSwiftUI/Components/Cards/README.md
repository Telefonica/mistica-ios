# Cards

* [DataCard](#datacard)
   * [How to use a DataCard](#how-to-use-a-datacard)
   * [Adding extra content to a DataCard](#adding-extra-content-to-a-datacard)
* [Accessibility](#accessibility)

## DataCard

DataCard is used to show relevant information (descriptions, data, statuses ...) of a user's product or service.

![DataCard](./docs/images/data-card.jpg)

### How to use a DataCard

Just use on the default initialisers depending on your needs. For example, a basic configuration:

```swift
 DataCard(
     headline: headline,
     title: title,
     subtitle: subtitle,
     description: description
)
```

### Adding extra content to a DataCard

A DataCard can be customized adding an extra view like

![DataCard](./docs/images/card-extra-content.jpg)

The extra `View` can be provided to be placed below the `descriptionTitle` property. It will keep the same margins than the view above so no constraints should be required in order to properly align it with the rest of the content.

```swift
DataCard(
    headline: headline,
    title: title,
    subtitle: subtitle,
    description: description,
    fragmentView: { Text("Fragment!") }
)
```
