import Foundation

extension Binary {
    public mutating func readBit() throws -> UInt8 {
        defer { cursor += 1 }
        return try bit(cursor)
    }
    
    public mutating func readBits(_ count: Int) throws -> Int {
        defer { cursor += count }
        return try bits(cursor...cursor + count - 1)
    }
    
    public mutating func readBits<T>(_ type: T.Type, count: Int = MemoryLayout<T>.size * .byteSize) throws -> T {
        print(count)
        defer { cursor += count }
        let data = try bytes(cursor...cursor + count - 1)
        return withUnsafeBytes(of: Data(data).prefix(count / .byteSize)) {
            $0.baseAddress!.assumingMemoryBound(to: T.self).pointee
        }
    }
}

extension Binary {
    public mutating func readBool() throws -> Bool {
        try readBit() != 0
    }
}
