import XCTest
import Binary

final class UInt64Tests: XCTestCase {
    func testScalingUnsignedIntegers() {
        XCTAssert(UInt64.scaling(integer: UInt64(18446744073709551615)) == 18446744073709551615)
        XCTAssert(UInt64.scaling(integer: UInt32(4294967295)) == 18446744073709551615)
        XCTAssert(UInt64.scaling(integer: UInt16(65535)) == 18446744073709551615)
        XCTAssert(UInt64.scaling(integer: UInt8(255)) == 18446744073709551615)
    }

    static var allTests = [
        ("testScalingUnsignedIntegers", testScalingUnsignedIntegers),
    ]
}
