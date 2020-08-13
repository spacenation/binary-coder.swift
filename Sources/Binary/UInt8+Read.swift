import Foundation

extension Array where Element == UInt8 {
    public func bit(_ index: Int) throws -> UInt8 {
        let byteIndex = index / .byte
        guard (0..<self.count).contains(byteIndex) else {
            throw BinaryError.indexOutOfBounds
            
        }
        let bitIndex = .indexOfLastBitInByte - (index % .byte)
        return (self[byteIndex] >> bitIndex) & 1
    }
    
    public func byte(_ index: Int) throws -> UInt8 {
        guard (0..<self.count).contains(index) else {
            throw BinaryError.indexOutOfBounds
        }
        return self[index]
    }
    
    public func byte(atBitIndex: Int) throws -> UInt8 {
        try (atBitIndex..<atBitIndex + .byte).reversed().enumerated().reduce(0) {
            let bit = try self.bit($1.element)
            return $0 + UInt8(bit) << $1.offset
        }
    }
    
    public func bytes(bitRange: ClosedRange<Int>) throws -> [UInt8] {
        let lastByteIndex = (bitRange.upperBound - bitRange.lowerBound) / .byte
        let lastBitIndex = bitRange.upperBound
        
        return try (0...lastByteIndex).map { byteIndex in
            let lowerBound = bitRange.lowerBound + byteIndex * .byte
            let upperBound = lowerBound + .indexOfLastBitInByte
            let gap = (((upperBound - lowerBound) + 1) % .byte)
            return try (lowerBound...upperBound).reversed().enumerated().reduce(0) {
                if lastBitIndex < $1.element {
                    return $0
                } else {
                    let bit = try self.bit($1.element)
                    return $0 + (bit << $1.offset)
                }

            } << gap
        }
    }
}
