import Foundation
import Binary

public func match(_ bit: Bit) -> BinaryDecoder<Bit> {
    BinaryDecoder { input in
        if let (head, tail) = input.readBit(), head == bit {
            return .success((head, tail))
        } else {
            return .failure(.mismatchedBit(input.cursor + 1))
        }
    }
}

public let zero: BinaryDecoder<Bit> = match(.zero)

public let one: BinaryDecoder<Bit> = match(.one)

