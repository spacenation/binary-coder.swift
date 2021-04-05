import Foundation
import Binary

public func type<T>(_ type: T.Type) -> BinaryDecoder<T> {
    BinaryDecoder { input in
        if let (head, tail) = input.read(type) {
            return .success((head, tail))
        } else {
            return .failure(.outOfBounds(input.cursor + MemoryLayout<T>.size))
        }
    }
}
