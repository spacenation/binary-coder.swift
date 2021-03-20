import Foundation
import Decoder
import Binary

public let bool: Decoder<BinaryReader, Bool, BinaryDecodingFailure> = bit.map { Bool.init(bit: $0) }
