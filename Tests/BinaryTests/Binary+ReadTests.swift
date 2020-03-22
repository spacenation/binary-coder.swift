import XCTest
import Binary

final class BinaryReadTests: XCTestCase {
    func testReadBits() {
        var binary = Binary(bytes: [0b1000_0111])
        XCTAssertEqual(binary.cursor, 0)
        XCTAssertEqual(try? binary.readBit(), 1)
        XCTAssertEqual(binary.cursor, 1)
        XCTAssertEqual(try? binary.readBits(6), 3)
        XCTAssertEqual(binary.cursor, 6)
        XCTAssertEqual(try? binary.readBool(), true)
        XCTAssertEqual(binary.cursor, 7)
    }

    static var allTests = [
        ("testReadBits", testReadBits),
    ]
}
