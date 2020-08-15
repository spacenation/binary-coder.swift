import XCTest
import Binary

final class UInt8Tests: XCTestCase {
    func testBinaryScaling() {
        /// Int to Int
        XCTAssert(%UInt8(255) == UInt8(255))
        XCTAssert(%UInt16(65535) == UInt8(255))
        XCTAssert(%UInt8(255) == UInt16(65280))
        XCTAssert(%UInt32(4294967295) == UInt8(255))
        XCTAssert(%UInt64(18446744073709551615) == UInt8(255))
        
        /// Float to Int
        XCTAssert(%Float(0) == UInt16(0))
        XCTAssert(%Float(1.0) == UInt8(255))
        XCTAssert(%Double(1.0) == UInt16(65535))
        /// Int to Float
        XCTAssert(%UInt8(255) == Float(1.0))
        XCTAssert(%UInt8(0) == Float(0))
    }

    static var allTests = [
        ("testBinaryScaling", testBinaryScaling),
    ]
}
