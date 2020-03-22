import Foundation

public struct Binary: Hashable {
    public internal(set) var bytes: [UInt8]
    public internal(set) var cursor: Int
    
    public init(bytes: [UInt8], cursor: Int = 0) {
        self.bytes = bytes
        self.cursor = cursor
    }
}
