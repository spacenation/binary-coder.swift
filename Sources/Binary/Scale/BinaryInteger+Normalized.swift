import Foundation

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
