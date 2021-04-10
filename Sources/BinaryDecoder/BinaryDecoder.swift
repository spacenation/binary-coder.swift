import Foundation
@_exported import Binary
@_exported import Functional

public typealias BinaryDecoder<Element> = Decoder<Bit, Element>

public extension Decoder where Primitive == Bit {
    func callAsFunction(_ bytes: [UInt8]) -> Output {
        decode(DecoderState(list: List(bytes.bits), offset: 0))
    }
}

public extension List where Element == Bit {
    var byte: UInt8 {
        self.reduce(0) { accumulated, current in
            accumulated << 1 | (current == .one ? 1 : 0)
        }
    }
}



