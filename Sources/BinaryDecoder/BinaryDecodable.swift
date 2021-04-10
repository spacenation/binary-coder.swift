import Foundation
import Binary

public protocol BinaryDecodable {
    static var binaryDecoder: BinaryDecoder<Self> { get }
}

public extension BinaryDecodable {
    static func decode(from data: Data) throws -> Self {
        switch Self.binaryDecoder(data.map { $0 }) {
        case .success((let element, _)):
            return element
        case .failure(let error):
            throw error
        }
    }
}
