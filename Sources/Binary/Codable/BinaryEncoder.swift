import Foundation

public final class BinaryEncoder {
    public internal(set) var bytes: Binary
    public internal(set) var cursor: Int
    
    public init() {
        self.bytes = []
        self.cursor = 0
    }
    
    public func encode<T>(_ value: T, size: Binary.Size = MemoryLayout<T>.size * .byte) {
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

extension BinaryEncoder {
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
    
    public func encodeEmpty(size: Binary.Size) {
        encode(0, size: size)
    }
}

public extension BinaryEncoder {
    static func encode<T>(_ value: T, size: Binary.Size = MemoryLayout<T>.size * .byte) -> Binary {
        let encoder = BinaryEncoder()
        encoder.encode(value, size: size)
        return encoder.bytes
    }
    
    static func encode<T: BinaryEncodable>(_ value: T) throws -> Binary {
        let encoder = BinaryEncoder()
        try value.encode(to: encoder)
        return encoder.bytes
    }
}
