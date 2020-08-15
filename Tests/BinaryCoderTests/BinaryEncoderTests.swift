import XCTest
import BinaryCoder

final class BinaryEncoderTests: XCTestCase {
    func testEncodeBits() {
        let binary = BinaryEncoder()
        XCTAssertEqual(binary.cursor, 0)
        
        binary.encodeBit(1)
        XCTAssertEqual(binary.cursor, 1)
        XCTAssertEqual(binary.bytes, [0b1000_0000])
        
        binary.encode(UInt8(3))
        XCTAssertEqual(binary.cursor, 9)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1000_0000])
        
        binary.encodeBool(true)
        XCTAssertEqual(binary.cursor, 10)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1100_0000])
        
        binary.encode(Data([0b1111_0111]), size: .bits(6))
        XCTAssertEqual(binary.cursor, 16)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101])
        
        binary.encode(UInt16(255))
        XCTAssertEqual(binary.cursor, 32)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101, 0b1111_1111, 0b0000_0000])
        
        binary.encodeBool(true)
        XCTAssertEqual(binary.cursor, 33)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101, 0b1111_1111, 0b0000_0000, 0b1000_0000])
                
        binary.encodeEmpty(size: .byte - 2)
        XCTAssertEqual(binary.cursor, 39)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101, 0b1111_1111, 0b0000_0000, 0b1000_0000])
        
        binary.encodeBool(true)
        XCTAssertEqual(binary.cursor, 40)
        XCTAssertEqual(binary.bytes, [0b1000_0001, 0b1111_1101, 0b1111_1111, 0b0000_0000, 0b1000_0001])
    }

    static var allTests = [
        ("testEncodeBits", testEncodeBits),
    ]
}
