import Foundation

public final class BinaryDecoder {
    private let bytes: Binary
    public internal(set) var cursor: Int
    
    public init(bytes: Binary) {
        self.bytes = bytes
        self.cursor = 0
    }
    
    public func decode<T: BinaryDecodable>(_ type: T.Type = T.self) throws -> T {
        try T(from: self)
    }
}

extension BinaryDecoder {
    public func skip(size: Binary.Size) throws {
        guard cursor + size < bytes.count * .byte else { throw BinaryError.indexOutOfBounds }
        cursor += size
    }
    
    public func decodeBit() throws -> UInt8 {
        defer { cursor += 1 }
        return try bytes.bit(cursor)
    }
    
    public func decodeBool() throws -> Bool {
        try decodeBit() != 0
    }
    
    public func decode<T>(_ type: T.Type = T.self, size: Binary.Size = MemoryLayout<T>.size * .byte) throws -> T {
        defer { cursor += size }
        let data = try bytes.bytes(bitRange: cursor...cursor + size - 1)
        return withUnsafeBytes(of: Data(data).prefix(size / .byte)) {
            $0.baseAddress!.assumingMemoryBound(to: T.self).pointee
        }
    }
}

public extension BinaryDecoder {
    static func decode<T>(_ type: T.Type, size: Binary.Size = MemoryLayout<T>.size * .byte, from bytes: Binary) throws -> T {
        let decoder = BinaryDecoder(bytes: bytes)
        return try decoder.decode(type, size: size)
    }
    
    static func decode<T: BinaryDecodable>(_ type: T.Type, from bytes: Binary) throws -> T {
        try T(from: BinaryDecoder(bytes: bytes))
    }
}
