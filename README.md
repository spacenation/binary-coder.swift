![ci](https://github.com/spacenation/binary-coder.swift/workflows/ci/badge.svg)

## BinaryCoder
SPM package to decode and encode types from binary data.

### Binary Decoder
```swift
try? BinaryDecoder.decode(Message<DeliveryFlags>.self, from: [0b0000_1111, 0b1111_1111, 0b0000_0011])
```

### Binary Encoder
```swift
try? BinaryEncoder.encode(Message(source: 15, data: Data([0b1111_1111]), flags: DeliveryFlags(isDelivered: true, isRead: true)))
```

### Example
```swift
private struct Message<Flags: Equatable & BinaryCodable>: Equatable, BinaryCodable {
    let source: UInt8
    let data: Data
    let flags: Flags
    
    init(source: UInt8, data: Data, flags: Flags) {
        self.source = source
        self.data = data
        self.flags = flags
    }
    
    init(from decoder: BinaryDecoder) throws {
        source = try decoder.decode()
        data = try decoder.decode(size: .byte)
        try decoder.skip(size: 6)
        flags = try decoder.decode()
    }
    
    func encode(to encoder: BinaryEncoder) throws {
        encoder.encode(source)
        encoder.encode(data, size: .byte)
        encoder.encodeEmpty(size: 6)
        try encoder.encode(flags)
    }
}
```

## Code Contributions
Feel free to contribute via fork/pull request to master branch. If you want to request a feature or report a bug please start a new issue.

## Coffee Contributions
If you find this project useful please consider becoming my GitHub sponsor.
