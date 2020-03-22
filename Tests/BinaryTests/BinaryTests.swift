import XCTest
@testable import Binary

final class BinaryTests: XCTestCase {
    func testEquatable() {
        XCTAssertEqual(Binary(bytes: [0b0000_00001]), Binary(bytes: [1]))
    }

    static var allTests = [
        ("testEquatable", testEquatable),
    ]
}
