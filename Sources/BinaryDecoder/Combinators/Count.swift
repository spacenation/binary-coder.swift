import Foundation
import Binary

public extension Decoder where Input == BinaryReader, Failure == BinaryDecodingFailure {
    func count(_ n: UInt) -> Decoder<BinaryReader, [Element], BinaryDecodingFailure> {
        Decoder<BinaryReader, [Element], BinaryDecodingFailure> { input in
            var items: [Element] = []
            var input1 = input
            var error: BinaryDecodingFailure? = nil
            
            (0..<n).forEach { _ in
                switch self.decode(input1) {
                case .success((let output, let input2)):
                    input1 = input2
                    items.append(output)
                case .failure(let error1):
                    error = error1
                }
            }
            
            if let error = error {
                return .failure(error)
            } else if items.count == n {
                return .success((items, input1))
            } else {
                return .failure(.mismatchedCount)
            }
        }
    }
}
