import Foundation

extension Binary {
    public func bit(_ index: Int) throws -> UInt8 {
        let byteIndex = index / .byteSize
        guard (0..<bytes.count).contains(byteIndex) else {
            throw BinaryError.indexOutOfBounds
            
        }
        let bitIndex = .indexOfLastBitInByte - (index % .byteSize)
        return (bytes[byteIndex] >> bitIndex) & 1
    }
    
    public func bits(_ range: ClosedRange<Int>) throws -> Int {
        try range.reversed().enumerated().reduce(0) {
            let bit = try self.bit($1.element)
            return $0 + Int(bit) << $1.offset
        }
    }
    
    public func bytes(_ range: ClosedRange<Int>) throws -> [UInt8] {
        let lastByteIndex = (range.upperBound - range.lowerBound) / .byteSize
        
        return try (0...lastByteIndex).map { byteIndex in
            let lowerBound = range.lowerBound + byteIndex * .byteSize
            let upperBound = lowerBound + .indexOfLastBitInByte
            let gap = (((upperBound - lowerBound) + 1) % .byteSize)
            return try (lowerBound...upperBound).reversed().enumerated().reduce(0) {
                print($1.element)
                let bit = try self.bit($1.element)
                return $0 + (bit << $1.offset)
            } << gap
        }
    }
}
