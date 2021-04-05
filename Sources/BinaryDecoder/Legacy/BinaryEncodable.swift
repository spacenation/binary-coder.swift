import Foundation

public protocol BinaryEncodable {
    func encode(to encoder: LegacyBinaryEncoder) throws
}
