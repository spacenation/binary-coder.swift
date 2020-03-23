import XCTest
import Binary

final class BinaryWriteTests: XCTestCase {
    func testWriteBits() {
        var binary = Binary(bytes: [])
        XCTAssertEqual(binary.cursor, 0)
        
        binary.writeBit(1)
        XCTAssertEqual(binary.cursor, 1)
        XCTAssertEqual(binary.bytes, [0b1000_0000])
        
        binary.writeBits(UInt8(3))
        XCTAssertEqual(binary.cursor, 9)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1000_0000])
        
        binary.writeBool(true)
        XCTAssertEqual(binary.cursor, 10)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1100_0000])
        
        binary.writeBits(Data([0b1111_0111]), count: 6)
        XCTAssertEqual(binary.cursor, 16)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101])
        
        binary.writeBits(UInt16(255))
        XCTAssertEqual(binary.cursor, 32)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101, 0b1111_1111, 0b0000_0000])
        
        binary.writeBool(true)
        XCTAssertEqual(binary.cursor, 33)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101, 0b1111_1111, 0b0000_0000, 0b1000_0000])
                
        binary.skip(count: 6)
        XCTAssertEqual(binary.cursor, 39)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101, 0b1111_1111, 0b0000_0000, 0b1000_0000])
        
        binary.writeBool(true)
        XCTAssertEqual(binary.cursor, 40)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101, 0b1111_1111, 0b0000_0000, 0b1000_0001])
    }

    static var allTests = [
        ("testWriteBits", testWriteBits),
    ]
}
