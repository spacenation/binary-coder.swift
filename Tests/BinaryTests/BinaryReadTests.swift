import XCTest
import Binary

final class BinaryReadTests: XCTestCase {
    func testReadBits() {
        var binary = Binary(bytes: [0b1000_0110, 0b0000_1111, 0b1111_0011])
        XCTAssertEqual(binary.cursor, 0)
        XCTAssertEqual(try? binary.readBit(), 1)
        XCTAssertEqual(binary.cursor, 1)
        XCTAssertEqual(try? binary.readBits(6), 3)
        XCTAssertEqual(binary.cursor, 7)
        XCTAssertEqual(try? binary.readBool(), false)
        XCTAssertEqual(binary.cursor, 8)
        XCTAssertEqual(try? binary.readBits(UInt8.self), 15)
        XCTAssertEqual(binary.cursor, 16)
        XCTAssertEqual(try! binary.readBits(Data.self, count: 8), Data([0b1111_0011]))
        XCTAssertEqual(binary.cursor, 24)
    }

    static var allTests = [
        ("testReadBits", testReadBits),
    ]
}
