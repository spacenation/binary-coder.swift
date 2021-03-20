import Foundation
import Decoder
import Binary

public let bit: Decoder<BinaryReader, Bit, BinaryDecodingFailure> =
    Decoder {
        input in
            if let (head, tail) = input.readBit() {
                return .success((head, tail))
            } else {
                return .failure(.outOfBounds)
            }
    }
