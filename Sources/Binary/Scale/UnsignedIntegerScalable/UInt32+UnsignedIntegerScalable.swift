import Foundation

extension UInt32: UnsignedIntegerScalable {
    public static func scaling(integer source: UInt8) -> UInt32 {
        UInt32(source) << 24 + UInt32(source) << 16 + UInt32(source) << 8 + UInt32(source)
    }
    
    public static func scaling(integer source: UInt16) -> UInt32 {
        UInt32(source) << 16 + UInt32(source)
    }
    
    public static func scaling(integer source: UInt32) -> UInt32 {
        source
    }
    
    public static func scaling(integer source: UInt64) -> UInt32 {
        UInt32(source >> 32)
    }
}
