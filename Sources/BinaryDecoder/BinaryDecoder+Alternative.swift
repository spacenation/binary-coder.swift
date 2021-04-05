import Foundation
import Functional

extension BinaryDecoder {
    public static func empty(error: BinaryDecodingFailure) -> Self {
        BinaryDecoder { _ in .failure(error) }
    }
    
    public func or(_ other: Self) -> Self {
        BinaryDecoder<Element> { input in
            switch self.decode(input) {
            case .success(let (element, next)):
                return .success((element, next))
            case .failure(_):
                return other.decode(input)
            }
        }
    }
}

public func <|><A>(left: BinaryDecoder<A>, right: BinaryDecoder<A>) -> BinaryDecoder<A> {
    left.or(right)
}
