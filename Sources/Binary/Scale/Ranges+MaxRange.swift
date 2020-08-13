import Foundation

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
