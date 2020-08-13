import XCTest
import Binary

final class UInt32Tests: XCTestCase {
    func testScalingUnsignedIntegers() {
        XCTAssert(UInt32.scaling(integer: UInt64(18446744073709551615)) == 4294967295)
        
        XCTAssert(UInt32.scaling(integer: UInt16(65535)) == 4294967295)
        
        XCTAssert(UInt32.scaling(integer: UInt8(255)) == 4294967295)
        XCTAssert(UInt32.scaling(integer: UInt8(1)) == 16843009)
    }

    static var allTests = [
        ("testScalingUnsignedIntegers", testScalingUnsignedIntegers),
    ]
}
