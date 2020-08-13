import Foundation

extension UInt8: UnsignedIntegerScalable {
    public static func scaling(integer source: UInt8) -> UInt8 {
        source
    }
    
    public static func scaling(integer source: UInt16) -> UInt8 {
        UInt8(source >> 8)
    }
    
    public static func scaling(integer source: UInt32) -> UInt8 {
        UInt8(source >> 24)
    }
    
    public static func scaling(integer source: UInt64) -> UInt8 {
        UInt8(source >> 56)
    }
}
