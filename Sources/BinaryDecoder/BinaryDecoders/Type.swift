import Foundation
import Decoder
import Binary

public func type<T>(_ type: T.Type) -> Decoder<BinaryReader, T, BinaryDecodingFailure> {
    Decoder { input in
        if let (head, tail) = input.read(type) {
            return .success((head, tail))
        } else {
            return .failure(.outOfBounds)
        }
    }
}
