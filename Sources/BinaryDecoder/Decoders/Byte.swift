import Foundation
import Binary

public let byte: Decoder<Bit, UInt8> = bit.count(8).map { $0.byte }
