import Foundation

public struct Binary: Hashable {
    public typealias Size = Int
    
    public internal(set) var bytes: [UInt8]
    public internal(set) var cursor: Int
    
    public init(bytes: [UInt8], cursor: Int = 0) {
        self.bytes = bytes
        self.cursor = cursor
    }
}

extension Int {
    public static let byteSize: Int = 8
    public static let indexOfLastBitInByte: Int = 7
}

extension Binary.Size {
    public static var bit: Int { 1 }
    public static func bits(_ count: Int) -> Int { count }
    
    public static var byte: Int { .byteSize }
    public static func bytes(_ count: Int) -> Int { count * .byteSize }
}
