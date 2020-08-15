import Foundation

prefix operator %

/// Int to Int
extension BinaryInteger {
    public func scaled<T: BinaryInteger>() -> T {
        let sizeDelta = MemoryLayout<Self>.size * 8 - MemoryLayout<T>.size * 8
        if sizeDelta > 0 {
            return T(self >> sizeDelta)
        }
        if sizeDelta < 0 {
            return T(self) >> sizeDelta
        }
        return T(self)
    }
}

public prefix func %<U: BinaryInteger, T: BinaryInteger>(integer: U) -> T {
    integer.scaled()
}

/// Int to Float
extension FixedWidthInteger {
    public func scaled<T: BinaryFloatingPoint>() -> T {
        T(self) / T(Self.max)
    }
}

public prefix func %<U: FixedWidthInteger, T: BinaryFloatingPoint>(integer: U) -> T {
    integer.scaled()
}

/// Float to Int
extension BinaryFloatingPoint {
    public func scaled<T: BinaryInteger & FixedWidthInteger>(in range: ClosedRange<Self>) -> T {
        T(Self(T.max) * self.normalized(in: range))
    }
}

public prefix func %<U: BinaryFloatingPoint, T: BinaryInteger & FixedWidthInteger>(floatingPoint: U) -> T {
    floatingPoint.scaled(in: .unitInterval)
}

/// Normalized
extension BinaryInteger where Self : FixedWidthInteger {
    public func normalized(in range: ClosedRange<Self> = .maxRange) -> Float {
        guard range.upperBound - range.lowerBound > 0 else { return 0 }
        let value = Swift.min(Swift.max(self, range.lowerBound), range.upperBound)
        return Float(value - range.lowerBound) / Float(range.upperBound - range.lowerBound)
    }
}

extension BinaryFloatingPoint {
    public func normalized(in range: ClosedRange<Self> = .unitInterval) -> Self {
        guard range.upperBound - range.lowerBound > 0 else { return 0 }
        let value = Swift.min(Swift.max(self, range.lowerBound), range.upperBound)
        return Self(value - range.lowerBound) / Self(range.upperBound - range.lowerBound)
    }
}


/// Scale factor

extension FixedWidthInteger where Self: UnsignedInteger {
    public func scalingDown(factor: Self) -> Self {
        let portion: Float = Float(factor) / Float(Self.max)
        let newValue = Float(self) * portion
        return Self.init(Swift.max(0, Swift.min(newValue, Float(Self.max))))
    }
    
    public func scalingUp(factor: Self) -> Self {
        guard factor > 0 else { return self }
        let portion: Float = Float(Self.max) / Float(factor)
        let newValue = Float(self) * portion
        return Self.init(Swift.max(0, Swift.min(newValue, Float(Self.max))))
    }
}

extension ClosedRange where Bound : BinaryFloatingPoint {
    public static var unitInterval: Self { 0.0...1.0 }
}

extension Range where Bound: FixedWidthInteger {
    public static var maxRange: Self {
        Bound.min..<Bound.max
    }
}

extension ClosedRange where Bound: FixedWidthInteger {
    public static var maxRange: Self {
        Bound.min...Bound.max
    }
}
