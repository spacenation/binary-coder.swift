import Foundation
import Binary

public let bool: Decoder<Bit, Bool> = bit.map { Bool.init(bit: $0) }
