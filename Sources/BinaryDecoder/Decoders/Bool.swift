import Foundation
import Binary

public let bool: BinaryDecoder<Bool> = bit.map { Bool.init(bit: $0) }
