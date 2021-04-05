import Foundation
import Functional

extension BinaryDecoder {
    public func map<T>(_ transform: @escaping (Element) -> T) -> BinaryDecoder<T> {
        BinaryDecoder<T> { input in
            self.decode(input).map { (transform($0.element), $0.next) }
        }
    }
}

public func <^><A, B>(transform: @escaping (A) -> B, a: BinaryDecoder<A>) -> BinaryDecoder<B> {
    a.map(transform)
}
