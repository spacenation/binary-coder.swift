import Foundation

public final class BinaryDecoder {
    private var binary: Binary
    
    public init(data: Data) {
        self.binary = Binary(bytes: data.map { $0 })
    }
    
    public func decode<T>(_ type: T.Type, count: Int = MemoryLayout<T>.size * .byteSize) throws -> T {
        try binary.readBits(type, count: count)
    }
    
    public func decode<T: BinaryDecodable>(_ type: T.Type) throws -> T {
        try T(from: self)
    }
}

public extension BinaryDecoder {
    func skip(count: Int) throws {
        binary.skip(count: count)
    }
    
    func decodeBool() throws -> Bool {
        try binary.readBool()
    }
}

public extension BinaryDecoder {
    static func decode<T>(_ type: T.Type, count: Int = MemoryLayout<T>.size * .byteSize, from data: Data) throws -> T {
        let decoder = BinaryDecoder(data: data)
        return try decoder.decode(type, count: count)
    }
    
    static func decode<T: BinaryDecodable>(_ type: T.Type, from data: Data) throws -> T {
        try T(from: BinaryDecoder(data: data))
    }
}
