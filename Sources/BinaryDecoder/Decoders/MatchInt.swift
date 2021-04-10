import Foundation
import Binary

public func match(_ numeric: UInt8) -> Decoder<Bit, UInt8> {
    Decoder { input in
        uInt8(input).flatMap { $0.0 == numeric ? .success($0) :
            .failure(.mismatchedPrimitive(input.offset))
        }
    }
}

public func match(_ numeric: UInt16) -> Decoder<Bit, UInt16> {
    Decoder { input in
        uInt16(input).flatMap { $0.0 == numeric ? .success($0) :
            .failure(.mismatchedPrimitive(input.offset))
        }
    }
}
