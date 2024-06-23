
# AutoLayoutDSL

## Purpose

The purpose of this DSL is to simplify working with AutoLayout in Swift without relying on external libraries. It provides a more readable and concise way to define constraints programmatically.

## Simplified Constraint Definition

With this DSL, you can replace the verbose standard AutoLayout code:

```swift
NSLayoutConstraint.activate([
    myView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 20),
    myView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -20),
    myView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 20),
    myView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -20)
])
```

with a more readable syntax:

```swift
myView.layout(in: superview) {
    $0.leading == superview.leadingAnchor + 20
    $0.trailing == superview.trailingAnchor - 20
    $0.top == superview.topAnchor + 20
    $0.bottom == superview.bottomAnchor - 20
}
```

## Constraint Types

With this DSL, you can easily define and assign various types of constraints to position and size your views. The following constraints can be assigned:

- **Leading and Trailing Anchors**: These define the horizontal edges of a view.
    ```swift
    $0.leading == anotherView.leadingAnchor + 20
    $0.trailing == anotherView.trailingAnchor - 20
    ```

- **Top and Bottom Anchors**: These define the vertical edges of a view.
    ```swift
    $0.top == anotherView.topAnchor + 20
    $0.bottom == anotherView.bottomAnchor - 20
    ```

- **Width and Height Anchors**: These define the dimensions of a view.
    ```swift
    $0.width == 100
    $0.height == 100
    ```

- **CenterX and CenterY Anchors**: These define the horizontal and vertical center alignment of a view.
    ```swift
    $0.centerX == anotherView.centerXAnchor
    $0.centerY == anotherView.centerYAnchor
    ```

## Custom Operators

The DSL includes custom operators to handle various constraint types, making the syntax even more intuitive:

- **Equal to**: `==`
- **Greater than or equal to**: `>=`
- **Less than or equal to**: `<=`
- **Multiplication for dimensions**: `*=`

```swift
myView.layout(in: superview) {
    $0.leading >= superview.leadingAnchor + 20
    $0.trailing <= superview.trailingAnchor
    $0.top >= superview.topAnchor + 20
    $0.bottom <= superview.bottomAnchor
}
```

The `*=` operator allows you to define width and height constraints as a multiple of another dimension. It is important to use the `*` operator to specify the multiplier value, which makes the syntax clear and expressive.

```swift
someView.layout(in: instrumentsView) {
    $0.width *= otherView.widthAnchor * 0.6 // someView's width will be 0.6 times otherView's width
    $0.height == $0.width // Height equal to width
}
```

In this example:
- `someView.widthAnchor` is set to 60% of `otherView.widthAnchor`.
- The `*` operator is essential to indicate the multiplier value, which follows the `*=` operator.

## Priority Customization

A custom operator `~` allows you to specify layout priorities:

```swift
resizeGestureView.layout(in: self) {
    $0.top == topAnchor - 16 ~ .defaultHigh
    $0.leading == leadingAnchor - 16 ~ .defaultHigh
    $0.trailing == trailingAnchor + 16 ~ .defaultHigh
    $0.bottom == bottomAnchor ~ .defaultLow
    $0.width >= 150
    $0.height >= 100
    $0.centerX == centerXAnchor
    $0.centerY == centerYAnchor
}
```

## Constraint Storage

Constraints can be assigned to variables for later modification if needed. The DSL allows for this by returning an active constraint from the constraint expression, which can be stored in a variable. This is useful when you need to modify or deactivate a specific constraint later in your code. The returned constraint is also marked as a discardable result, meaning you can choose to ignore it if you don’t need to keep a reference to it.

```swift
var someTopConstraint: NSLayoutConstraint?

myView.layout(in: anotherView) {
    someTopConstraint = $0.top == anotherView.topAnchor + 20
    $0.leading == anotherView.leadingAnchor + 20
    $0.trailing == anotherView.trailingAnchor - 20
    $0.bottom == anotherView.bottomAnchor - 20
}
```

In this example:
- The top constraint for `myView` is assigned to the variable `someTopConstraint`.
- The DSL expression `$0.top == anotherView.topAnchor + 20` returns an active `NSLayoutConstraint`, which can be stored in `someTopConstraint`.
- You can later modify or deactivate `someTopConstraint` as needed.

## Installation

Just copy the `AutoLayoutDSL.swift` file to your project and start using it.

## License

This project is licensed under the MIT License.
