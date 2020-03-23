import Foundation

public final class BinaryEncoder {
    var binary: Binary
    
    public init() {
        self.binary = Binary(bytes: [])
    }
    
    public func encode<T>(_ value: T, count: Int = MemoryLayout<T>.size * .byteSize) {
        binary.writeBits(value, count: count)
    }
    
    public func encode<T: BinaryEncodable>(_ value: T, count: Int = MemoryLayout<T>.size * .byteSize) throws {
        try value.encode(to: self)
    }
}

public extension BinaryEncoder {
    func skip(count: Int) {
        binary.skip(count: count)
    }
    
    func encodeBool(_ value: Bool) {
        binary.writeBool(value)
    }
}

public extension BinaryEncoder {
    static func encode<T>(_ value: T, count: Int = MemoryLayout<T>.size * .byteSize) -> Data {
        let encoder = BinaryEncoder()
        encoder.encode(value, count: count)
        return Data(encoder.binary.bytes)
    }
    
    static func encode<T: BinaryEncodable>(_ value: T) throws -> Data {
        let encoder = BinaryEncoder()
        try value.encode(to: encoder)
        return Data(encoder.binary.bytes)
    }
}
