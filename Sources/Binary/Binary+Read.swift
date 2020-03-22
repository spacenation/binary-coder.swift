import Foundation

extension Binary {
    public mutating func readBit() throws -> UInt8 {
        defer { cursor += 1 }
        return try bit(cursor)
    }
    
    public mutating func readBits(_ count: Int) throws -> Int {
        let increment = count - 1
        defer { cursor += increment }
        return try bits(cursor...cursor + increment)
    }
}

extension Binary {
    public mutating func readBool() throws -> Bool {
        try readBit() != 0
    }
}
