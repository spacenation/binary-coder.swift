import Foundation

public extension Binary {
    mutating func skip(size: Size) {
        cursor += size
    }
}
