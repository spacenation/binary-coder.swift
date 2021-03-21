import Foundation
import Decoder
import Binary

public func match(_ bit: Bit) -> Decoder<BinaryReader, Bit, BinaryDecodingFailure> {
    Decoder { input in
        if let (head, tail) = input.readBit(), head == bit {
            return .success((head, tail))
        } else {
            return .failure(.mismatchedBit)
        }
    }
}

public let zero: Decoder<BinaryReader, Bit, BinaryDecodingFailure> = match(.zero)

public let one: Decoder<BinaryReader, Bit, BinaryDecodingFailure> = match(.one)


