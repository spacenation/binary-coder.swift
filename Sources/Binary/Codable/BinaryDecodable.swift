import Foundation

public protocol BinaryDecodable {
    init(from decoder: BinaryDecoder) throws
}
