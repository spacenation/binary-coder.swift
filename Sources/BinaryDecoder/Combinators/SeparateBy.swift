import Foundation

public extension Decoder {
    func separate<A>(by separator: Decoder<Primitive, A>) -> Decoder<Primitive, [Element]> {
        separator
            .discardThen(self)
            .many
            .apply(
                self.map(curry(Array.init))
            )
    }
}
