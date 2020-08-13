import XCTest
import Binary

final class UInt8Tests: XCTestCase {
    func testScalingUnsignedIntegers() {
        XCTAssert(UInt8.scaling(integer: UInt8(255)) == 255)
        XCTAssert(UInt8.scaling(integer: UInt8(127)) == 127)
        XCTAssert(UInt8.scaling(integer: UInt8(1)) == 1)
        XCTAssert(UInt8.scaling(integer: UInt8(0)) == 0)
        
        XCTAssert(UInt8.scaling(integer: UInt16(65535)) == 255)
        XCTAssert(UInt8.scaling(integer: UInt16(32896)) == 128)
        XCTAssert(UInt8.scaling(integer: UInt16(0)) == 0)
        
        XCTAssert(UInt8.scaling(integer: UInt32(4294967295)) == 255)
        XCTAssert(UInt8.scaling(integer: UInt32(0)) == 0)
        
        XCTAssert(UInt8.scaling(integer: UInt64(18446744073709551615)) == 255)
        XCTAssert(UInt8.scaling(integer: UInt64(0)) == 0)
    }

    static var allTests = [
        ("testScalingUnsignedIntegers", testScalingUnsignedIntegers),
    ]
}
