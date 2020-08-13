import Foundation

public protocol FloatingPointScalable {
    static func scaling<T: BinaryFloatingPoint>(floatingPoint: T, in range: ClosedRange<T>) -> Self
}

extension FloatingPointScalable where Self: UnsignedInteger & FixedWidthInteger {
    public static func scaling<T: BinaryFloatingPoint>(floatingPoint: T, in range: ClosedRange<T>) -> Self {
        Self(T(Self.max) * floatingPoint.normalized(in: range))
    }
}

public extension FloatingPointScalable {
    init(scaling floatingPoint: Float, in range: ClosedRange<Float>) {
        self = Self.scaling(floatingPoint: floatingPoint, in: range)
    }
    
    init(scaling floatingPoint: Double, in range: ClosedRange<Double>) {
        self = Self.scaling(floatingPoint: floatingPoint, in: range)
    }
}

public prefix func %<T: FloatingPointScalable>(floatingPoint: Float) -> T {
    T(scaling: floatingPoint, in: .unitInterval)
}

public prefix func %<T: FloatingPointScalable>(floatingPoint: Double) -> T {
    T(scaling: floatingPoint, in: .unitInterval)
}
