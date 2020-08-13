import Foundation

extension Array where Element == UInt8 {
    public typealias Size = Int
}

extension Array<UInt8>.Size {
    public static let indexOfLastBitInByte: Int = 7
    
    public static var bit: Int = 1
    public static func bits(_ count: Int) -> Int { count }
    
    public static let byte: Int = 8
    public static func bytes(_ count: Int) -> Int { count * .byte }
}
