import Foundation
import Binary

public let bit: BinaryDecoder<Bit> =
    BinaryDecoder {
        input in
            if let (head, tail) = input.readBit() {
                return .success((head, tail))
            } else {
                return .failure(.outOfBounds(input.cursor + 1))
            }
    }
