import Foundation
import Functional

extension BinaryDecoder {
    public static func pure(_ a: Element) -> Self {
        BinaryDecoder { .success((a, $0)) }
    }
    
    public func apply<T>(_ transform: BinaryDecoder<(Element) -> T>) -> BinaryDecoder<T> {
        transform.flatMap { self.map($0) }
    }
    
    public func discard<A>(_ a: BinaryDecoder<A>) -> Self {
        a.apply(self.map(constant))
    }
    
    public func discardThen<A>(_ a: BinaryDecoder<A>) -> BinaryDecoder<A> {
        a.apply(self.map(constant(identity)))
    }
}

public func <*><A, B>(left: BinaryDecoder<(A) -> B>, right: BinaryDecoder<A>) -> BinaryDecoder<B> {
    right.apply(left)
}

public func <*<A, B>(left: BinaryDecoder<A>, right: BinaryDecoder<B>) -> BinaryDecoder<A> {
    left.discard(right)
}

public func *><A, B>(left: BinaryDecoder<A>, right: BinaryDecoder<B>) -> BinaryDecoder<B> {
    left.discardThen(right)
}
