#  Carousel

The carousel component is a container that distributes horizontally the elements inside of it.

## Usage

Create an instance of `Carousel` using the provided initialisers. 
- A `RandomAccessCollection` is required to initialize the `Carousel`.
- If the items do not implement identifiable, a keypath to the an identifier can be provided.
- The `index` binding will expose the selected item.

```swift
Carousel(0..<10, id: \.self, index: $index) { _ in
    Rectangle()
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
}
```

## Styles

`Carousel` come in two styles. `Default` and `Fullwidth`. The `Fullwidth` will display the controls above the `Carousel`

## Autoplay

A `Carousel` can move independently by setting up the right `autoplay` configuration.
To set up a Carousels that automatically moves trough the items every two seconds you can use the `autoplay` modifier:
```swift
Carousel(0..<10, id: \.self, index: $index) { _ in
    Rectangle()
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
}
.autoplay(.active(TimeInterval(2)))
```

## Scrolling

The scroll of the `Carousel` allows to move trough the items freely or in a paginated way.

```swift
Carousel(0..<10, id: \.self, index: $index) { _ in
    Rectangle()
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
}
.scrollStyle(.paginated)
```

## Controls

The scroll can display a control view to of all the available items and the selected one. 
By default it will display the bullets control

```swift
Carousel(0..<10, id: \.self, index: $index) { _ in
    Rectangle()
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
}
.controlsStyle(.bullets)
```

However, control can be disabled by using the `.disabled` style.

```swift
Carousel(0..<10, id: \.self, index: $index) { _ in
    Rectangle()
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
}
.controlsStyle(.disabled)
```
