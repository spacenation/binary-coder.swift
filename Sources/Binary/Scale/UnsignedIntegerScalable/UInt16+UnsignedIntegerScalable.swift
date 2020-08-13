import Foundation

extension UInt16: UnsignedIntegerScalable {
    public static func scaling(integer source: UInt8) -> UInt16 {
        UInt16(source) << 8 + UInt16(source)
    }
    
    public static func scaling(integer source: UInt16) -> UInt16 {
        source
    }
    
    public static func scaling(integer source: UInt32) -> UInt16 {
        UInt16(source >> 16)
    }
    
    public static func scaling(integer source: UInt64) -> UInt16 {
        UInt16(source >> 48)
    }
}
