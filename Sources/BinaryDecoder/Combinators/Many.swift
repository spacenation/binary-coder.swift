import Foundation

public extension BinaryDecoder {
    var many: BinaryDecoder<[Element]> {
        BinaryDecoder<[Element]> { input in
            var items: [Element] = []
            var input1 = input
            while case let .success((output, input2)) = self.decode(input1) {
                input1 = input2
                items.append(output)
            }
            return .success((items, input1))
        }
    }
}
