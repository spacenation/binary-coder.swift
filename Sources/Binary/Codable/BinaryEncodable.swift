import Foundation

public protocol BinaryEncodable {
    func encode(to encoder: BinaryEncoder) throws
}
