import Foundation
import Binary

public func type<T>(_ type: T.Type) -> Decoder<Bit, T> {
    byte.count(UInt(MemoryLayout<T>.size))
        .map { data in
            withUnsafeBytes(of: Data(data).prefix(MemoryLayout<T>.size / 8)) {
                $0.baseAddress!.assumingMemoryBound(to: T.self).pointee
            }
        }
}
