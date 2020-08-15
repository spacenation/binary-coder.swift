import XCTest
import BinaryCoder

final class BinaryDecoderTests: XCTestCase {
    func testDecodeBits() {
        let binary = BinaryDecoder(bytes: [0b1000_0110, 0b0000_1111, 0b1111_0011])
        XCTAssertEqual(binary.cursor, 0)
        XCTAssertEqual(try? binary.decodeBit(), 1)
        XCTAssertEqual(binary.cursor, 1)
        XCTAssertEqual(try? binary.decode(size: 6), 0b0000_1100)
        XCTAssertEqual(binary.cursor, 7)
        XCTAssertEqual(try? binary.decodeBool(), false)
        XCTAssertEqual(binary.cursor, 8)
        XCTAssertEqual(try? binary.decode(UInt8.self), 15)
        XCTAssertEqual(binary.cursor, 16)
        XCTAssertEqual(try! binary.decode(Data.self, size: .byte), Data([0b1111_0011]))
        XCTAssertEqual(binary.cursor, 24)
    }

    static var allTests = [
        ("testDecodeBits", testDecodeBits),
    ]
}
