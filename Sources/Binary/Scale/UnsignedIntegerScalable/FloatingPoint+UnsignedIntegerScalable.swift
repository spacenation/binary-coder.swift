import Foundation

extension Float: UnsignedIntegerScalable {
    public static func scaling<T: FixedWidthInteger & UnsignedInteger>(integer: T) -> Float {
        Float(integer) / Float(T.max)
    }
}

extension Double: UnsignedIntegerScalable {
    public static func scaling<T: FixedWidthInteger & UnsignedInteger>(integer: T) -> Double {
        Double(integer) / Double(T.max)
    }
}
