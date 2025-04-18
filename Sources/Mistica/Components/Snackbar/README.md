#  Snackbar

Snackbar provide lightweight feedback about an operation. They show a brief message at the bottom of the screen. It is positioned floating at the bottom of the screen respecting the safe area and, if there is a tab bar, it appears above it. Snackbar appear above all other elements on screen and only one can be displayed at a time.
Snackbar can also contain an action.

<p align="center">
<img width="400" alt="portfolio_view" src="./docs/images/snackbar-action.png">
</p>

## Usage

To display a snackbar, use the `SnackbarController` class. This class manages the presentation of snackbars and ensures that any currently displayed snackbar is dismissed before showing a new one.

The `showSnackbar` method will show the snackbar. 

## Styles

Snackbar come in two flavors. `Info` and `Critical`.

| `Info`                                        | `Critical`                                        |
|-----------------------------------------------|---------------------------------------------------|
| ![Info](./docs/images/snackbar-style-info.png) | ![Info](./docs/images/snackbar-style-critical.png) |

## Dismissal / Cancellation

When presenting a snackbar via the `showSnackbar` method, you are given a `SnackbarController.Token` type you can use to later `dismiss` the snackbar if needed.

![Demo](./docs/images/snackbar-demo.gif)

## Config

When configuring the Snackbar you can select different intervals with some features:

| `Interval` |   `Close`  |  `Action`  |
|------------|------------|------------|
|     5"     |     NO     |     NO     |
|     10"    |     NO     |  Mandatory |
|  Infinite  |  Mandatory |     NO     |
|  Infinite  |  Optional  |    YES     |
