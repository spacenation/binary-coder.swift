import Foundation

public enum BinaryDecodingFailure: Error, Equatable {
    case mismatchedBit(Int)
    case outOfBounds(Int)
    case mismatchedCount
}
