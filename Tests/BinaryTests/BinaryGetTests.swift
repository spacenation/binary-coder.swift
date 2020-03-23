import XCTest
import Binary

final class BinaryGetTests: XCTestCase {
    func testGetBit() {
        XCTAssertEqual(try? Binary(bytes: [0b0000_0001]).bit(6), 0)
        XCTAssertEqual(try? Binary(bytes: [0b0000_0001]).bit(7), 1)
        XCTAssertEqual(try? Binary(bytes: [0b0000_0001, 0b1111_1111]).bit(8), 1)
        XCTAssertEqual(try? Binary(bytes: [0b0000_0001]).bit(8), nil)
    }
    
    func testGetBits() {
        XCTAssertEqual(try? Binary(bytes: [0b0000_0101]).bits(3...6), 2)
        XCTAssertEqual(try? Binary(bytes: [0b0000_0101]).bits(4...7), 5)
        XCTAssertEqual(try? Binary(bytes: [0b0000_1111, 0b1111_0000]).bits(4...11), 255)
        XCTAssertEqual(try? Binary(bytes: [0b0000_0101]).bits(4...8), nil)
    }
    
    func testGetBytes() {
        XCTAssertEqual(try? Binary(bytes: [0b0000_1111, 0b1011_0000]).bytes(0...15), [0b0000_1111, 0b1011_0000])
       // XCTAssertEqual(try? Binary(bytes: [0b1000_1111]).bytes(0...3), [0b1000_0000])
    }

    static var allTests = [
        ("testGetBit", testGetBit),
        ("testGetBits", testGetBits),
    ]
}
