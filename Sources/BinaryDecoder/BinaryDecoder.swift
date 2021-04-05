import Foundation
@_exported import Binary
@_exported import Functional

public struct BinaryDecoder<Element> {
    public typealias Output = Result<(element: Element, next: BinaryReader), BinaryDecodingFailure>
    
    public let decode: (BinaryReader) -> Output
    
    public init(decode: @escaping (BinaryReader) -> Output) {
        self.decode = decode
    }
    
    func callAsFunction(_ input: BinaryReader) -> Output {
        decode(input)
    }
}
