import Foundation

public enum BinaryDecodingFailure: Error, Equatable {
    case mismatchedBit
    case outOfBounds
}
