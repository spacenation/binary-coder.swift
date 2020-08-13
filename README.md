![ci](https://github.com/swift-extensions/binary/workflows/ci/badge.svg)

## Binary

- BinaryReader
- BinaryEncoder
- BinaryDecoder
- BinaryScaler

## Binary type scaler

Custom `%`  prefix operator to scale binary integers proportionality between integer types.

- Works with UInt8, Unt16, UInt32, UInt64
- Works with Float and Double
- Fast conversion with binary shifting
- Scaling up and down

### Unsigned Integers
```swift
let result: UInt16 = %UInt8(255)
/// Result is 65535

let result: UInt16 = %UInt8(128)
/// Result is 32896
```

### Floating Points
```swift
let result: UInt8 = %0.5
/// Result is 127

let result: UInt16 = %1.0
/// Result is 65535
/// Operator is using UnitInterval (0.0...1.0) as base range for scaling.
```

## Code Contributions
Feel free to contribute via fork/pull request to master branch. If you want to request a feature or report a bug please start a new issue.

## Coffee Contributions
If you find this project useful please consider becoming my GitHub sponsor.
