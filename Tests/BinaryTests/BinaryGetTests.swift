import XCTest
import Binary

final class BinaryGetTests: XCTestCase {
    func testGetBit() {
        XCTAssertEqual(try? Binary(bytes: [0b0000_0001]).bit(6), 0)
        XCTAssertEqual(try? Binary(bytes: [0b0000_0001]).bit(7), 1)
        XCTAssertEqual(try? Binary(bytes: [0b0000_0001, 0b1111_1111]).bit(8), 1)
        XCTAssertEqual(try? Binary(bytes: [0b0000_0001]).bit(8), nil)
    }
    
    func testGetBytes() {
        XCTAssertEqual(try? Binary(bytes: [0b0000_1111, 0b1011_0000]).byte(1), 0b1011_0000)
        XCTAssertEqual(try? Binary(bytes: [0b0000_1111, 0b1011_0000]).byte(atBitIndex: 4), 0b1111_1011)
        XCTAssertEqual(try? Binary(bytes: [0b0000_1111, 0b1011_0000]).bytes(bitRange: 0...15), [0b0000_1111, 0b1011_0000])
        XCTAssertEqual(try? Binary(bytes: [0b0000_1111, 0b1011_0000, 0b1111_1111]).bytes(bitRange: 4...19), [0b1111_1011, 0b0000_1111])
        XCTAssertEqual(try? Binary(bytes: [0b1000_1111]).bytes(bitRange: 0...4), [0b1000_1000])
    }

    static var allTests = [
        ("testGetBit", testGetBit)
    ]
}
