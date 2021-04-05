//import Foundation
//@_exported import Binary
//@_exported import Functional
//
//public final class LegacyBinaryDecoder {
//    private let bytes: [UInt8]
//    public internal(set) var cursor: Int
//    
//    public init(bytes: [UInt8]) {
//        self.bytes = bytes
//        self.cursor = 0
//    }
//    
//    public func decode<T: BinaryDecodable>(_ type: T.Type = T.self) throws -> T {
//        try T(from: self)
//    }
//}
//
//extension LegacyBinaryDecoder {
//    public func skip(size: Array<UInt8>.Size) throws {
//        guard cursor + size < bytes.count * .byte else { throw BinaryError.indexOutOfBounds }
//        cursor += size
//    }
//    
//    public func decodeBit() throws -> UInt8 {
//        defer { cursor += 1 }
//        return try bytes.bitAsByte(cursor)
//    }
//    
//    public func decodeBool() throws -> Bool {
//        try decodeBit() != 0
//    }
//    
//    public func decode<T>(_ type: T.Type = T.self, size: Array<UInt8>.Size = MemoryLayout<T>.size * .byte) throws -> T {
//        defer { cursor += size }
//        let data = try bytes.bytes(bitRange: cursor...cursor + size - 1)
//        return withUnsafeBytes(of: Data(data).prefix(size / .byte)) {
//            $0.baseAddress!.assumingMemoryBound(to: T.self).pointee
//        }
//    }
//}
//
//public extension LegacyBinaryDecoder {
//    static func decode<T>(_ type: T.Type, size: Array<UInt8>.Size = MemoryLayout<T>.size * .byte, from bytes: [UInt8]) throws -> T {
//        let decoder = LegacyBinaryDecoder(bytes: bytes)
//        return try decoder.decode(type, size: size)
//    }
//    
//    static func decode<T: BinaryDecodable>(_ type: T.Type, from bytes: [UInt8]) throws -> T {
//        try T(from: LegacyBinaryDecoder(bytes: bytes))
//    }
//}
