import Foundation

public final class LegacyBinaryEncoder {
    public internal(set) var bytes: [UInt8]
    public internal(set) var cursor: Int
    
    public init() {
        self.bytes = []
        self.cursor = 0
    }
    
    public func encode<T>(_ value: T, size: Array<UInt8>.Size = MemoryLayout<T>.size * .byte) {
        var value = value
        var counter = 0
        withUnsafeBytes(of: &value) { pointer in
            pointer.forEach { byte in
                (0...Int.indexOfLastBitInByte).reversed().forEach {
                    guard counter < size else { return }
                    self.encodeBit((byte >> $0) & 1)
                    counter += 1
                }
            }
        }
        (counter..<size).forEach { _ in
            self.encodeBit(0)
        }
    }
    
    public func encode<T: BinaryEncodable>(_ value: T) throws {
        try value.encode(to: self)
    }
}

extension LegacyBinaryEncoder {
    public func encodeBit(_ value: UInt8) {
        let byte: UInt8 = value << Int(.indexOfLastBitInByte - (cursor % .byte))
        let index = cursor / .byte
        
        if bytes.count == index {
            bytes.append(byte)
        } else {
            bytes[index] ^= byte
        }
        cursor += 1
    }

    public func encodeBool(_ value: Bool) {
        encodeBit(value ? 1 : 0)
    }
    
    public func encodeEmpty(size: Array<UInt8>.Size) {
        encode(0, size: size)
    }
}

public extension LegacyBinaryEncoder {
    static func encode<T>(_ value: T, size: Array<UInt8>.Size = MemoryLayout<T>.size * .byte) -> [UInt8] {
        let encoder = LegacyBinaryEncoder()
        encoder.encode(value, size: size)
        return encoder.bytes
    }
    
    static func encode<T: BinaryEncodable>(_ value: T) throws -> [UInt8] {
        let encoder = LegacyBinaryEncoder()
        try value.encode(to: encoder)
        return encoder.bytes
    }
}
