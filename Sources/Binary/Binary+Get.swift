import Foundation

extension Binary {
    public func bit(_ index: Int) throws -> UInt8 {
        let cursor = index / .byteSize
        guard (0..<bytes.count).contains(cursor) else { throw BinaryError.indexOutOfBounds }
        let bitIndex = .indexOfLastBitInByte - (index % .byteSize)
        return (bytes[cursor] >> bitIndex) & 1
    }
    
    public func bits(_ range: ClosedRange<Int>) throws -> Int {
        try range.reversed().enumerated().reduce(0) {
            let bit = try self.bit($1.element)
            return $0 + Int(bit) << $1.offset
        }
    }
}
