import Foundation
import Decoder
import Binary

public let byte: Decoder<BinaryReader, UInt8, BinaryDecodingFailure> = type(UInt8.self)
