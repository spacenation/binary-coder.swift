import XCTest
import BinaryDecoder
import Functional
import Binary

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
    
    func testTypeBuilding() {
        struct Options: Equatable {
            let this: UInt8
            let that: UInt8
            let other: UInt16
        }
        
        var coder: BinaryDecoder<Options> {
            curry(Options.init)
                <^> type(UInt8.self)
                <*> bit.count(8).discardThen(type(UInt8.self))
                <*> type(UInt16.self)
        }
        
        switch coder.decode(BinaryReader(bytes: [0b0000_0001, 0b0000_0000, 0b0000_0010, 0b0000_0011, 0b0000_0000])) {
        case .success((let options, _)):
            XCTAssertEqual(options, Options(this: 1, that: 2, other: 3))
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

    static var allTests = [
        ("testBitDecoder", testBitDecoder),
    ]
}
