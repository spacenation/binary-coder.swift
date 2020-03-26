import Foundation

extension Binary {
    public mutating func writeBit(_ value: UInt8) {
        let byte: UInt8 = value << Int(.indexOfLastBitInByte - (cursor % .byteSize))
        let index = cursor / .byteSize
        
        if bytes.count == index {
            bytes.append(byte)
        } else {
            bytes[index] ^= byte
        }
        cursor += 1
    }
    
    public mutating func write<T>(_ value: T, size: Size = MemoryLayout<T>.size * .byteSize) {
        var value = value
        var counter = 0
        withUnsafeBytes(of: &value) { pointer in
            pointer.forEach { byte in
                (0...Int.indexOfLastBitInByte).reversed().forEach {
                    guard counter < size else { return }
                    self.writeBit((byte >> $0) & 1)
                    counter += 1
                }
            }
        }
        (counter..<size).forEach { _ in
            self.writeBit(0)
        }
    }
}

extension Binary {
    public mutating func writeBool(_ value: Bool) {
        writeBit(value ? 1 : 0)
    }
    
    public mutating func writeEmpty(size: Size) {
        write(0, size: size)
    }
}
