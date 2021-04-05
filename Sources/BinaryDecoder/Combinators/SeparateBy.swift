import Foundation

public extension BinaryDecoder {
    func separate<A>(by separator: BinaryDecoder<A>) -> BinaryDecoder<[Element]> {
        separator
            .discardThen(self)
            .many
            .apply(
                self.map(curry(Array.init))
            )
    }
}
