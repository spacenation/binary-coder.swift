import Foundation

public extension Binary {
    mutating func skip(count: Int) {
        cursor += count
    }
}
