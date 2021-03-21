import XCTest
import BinaryDecoder
import Functional

final class BinaryDecoderTests: XCTestCase {
    
    func testTypeDecoding() {
        struct Options: Equatable {
            let this: UInt8
            let that: UInt8
        }
        
        let coder = type(Options.self)
        
        switch coder.decode(BinaryReader(bytes: [0b0000_0001, 0b0000_0010])) {
        case .success((let options, _)):
            XCTAssertEqual(options, Options(this: 1, that: 2))
        case .failure(_):
            XCTFail()
        }
        
    }
    
    func testBitDecoder() {
        let coder = zero <|> one *> bit
        
        switch coder.decode(BinaryReader(bytes: [0b0101_0000])) {
        case .success(_):
            print("OK")
        case .failure(_):
            XCTFail()
        }
    }
    
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
