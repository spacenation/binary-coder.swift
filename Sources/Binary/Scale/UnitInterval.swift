import Foundation

extension ClosedRange where Bound : BinaryFloatingPoint {
    public static var unitInterval: Self { 0.0...1.0 }
}
