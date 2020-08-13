import Foundation

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
