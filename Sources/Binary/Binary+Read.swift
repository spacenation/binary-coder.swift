import Foundation

extension Binary {
    public mutating func readBit() throws -> UInt8 {
        defer { cursor += 1 }
        return try bit(cursor)
    }
    
    public mutating func read<T>(_ type: T.Type = T.self, size: Size = MemoryLayout<T>.size * .byteSize) throws -> T {
        defer { cursor += size }
        let data = try bytes(bitRange: cursor...cursor + size - 1)
        return withUnsafeBytes(of: Data(data).prefix(size / .byteSize)) {
            $0.baseAddress!.assumingMemoryBound(to: T.self).pointee
        }
    }
}

extension Binary {
    public mutating func readBool() throws -> Bool {
        try readBit() != 0
    }
}
